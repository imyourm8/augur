import Augur from "augur.js";
import * as Knex from "knex";
import { promisify } from "util";
import { downloadAugurLogs } from "./download-augur-logs";
import { augurEmitter } from "../events";
import { logger } from "../utils/logger";
import { SubscriptionEventNames } from "../constants";
import { delay } from "bluebird";

const BLOCKSTREAM_HANDOFF_BLOCKS = 5;
const BLOCKSTREAM_HANDOFF_WAIT_TIME_MS = 15000;
let syncFinished = false;

interface HighestBlockNumberRow {
  highestBlockNumber: number;
}

export function isSyncFinished() {
  return syncFinished;
}

function setSyncFinished() {
  syncFinished = true;
  augurEmitter.emit(SubscriptionEventNames.SyncFinished);
}

export async function bulkSyncAugurNodeWithBlockchain(db: Knex, augur: Augur): Promise<number> {
  const row: HighestBlockNumberRow|null = await db("blocks").max("blockNumber as highestBlockNumber").first();
  const lastSyncBlockNumber: number|null|undefined = row!.highestBlockNumber;
  const uploadBlockNumber: number = augur.contracts.uploadBlockNumbers[augur.rpc.getNetworkID()] || 0;
  let highestBlockNumber: number = await getHighestBlockNumber(augur);
  let fromBlock: number;
  if (uploadBlockNumber > highestBlockNumber) {
    logger.info(`Synchronization started at (${uploadBlockNumber}), which exceeds the current block from the ethereum node (${highestBlockNumber}), starting from 0 instead`);
    fromBlock = 0;
  } else {
    fromBlock = lastSyncBlockNumber == null ? uploadBlockNumber : lastSyncBlockNumber + 1;
  }
  let handoffBlockNumber = highestBlockNumber - BLOCKSTREAM_HANDOFF_BLOCKS;
  let skipBulkDownload = false;
  while (handoffBlockNumber < fromBlock) {
    skipBulkDownload = true;
    logger.warn(`Not enough blocks to start blockstream reliably, waiting at least ${BLOCKSTREAM_HANDOFF_BLOCKS} from ${fromBlock}. Current Block: ${highestBlockNumber}`);
    await delay(BLOCKSTREAM_HANDOFF_WAIT_TIME_MS);
    highestBlockNumber = await getHighestBlockNumber(augur);
    handoffBlockNumber = highestBlockNumber - BLOCKSTREAM_HANDOFF_BLOCKS;
  }
  if (skipBulkDownload) {
    logger.info(`Skipping batch load`);
    return fromBlock;
  }
  await promisify(downloadAugurLogs)(db, augur, fromBlock, handoffBlockNumber);
  setSyncFinished();
  await db.insert({ highestBlockNumber }).into("blockchain_sync_history");
  logger.info(`Finished batch load from ${fromBlock} to ${handoffBlockNumber}`);
  return handoffBlockNumber;
}

async function getHighestBlockNumber(augur: Augur): Promise<number> {
  return new Promise<number>((resolve, reject) => {
    augur.rpc.eth.blockNumber("latest", (error, blockNumber: string) => {
      if (error) reject("Couldn't get block number");
      resolve(parseInt(blockNumber.toString(), 16));
    });
  });
}
