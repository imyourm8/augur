import * as _ from 'lodash';
import * as IPFS from 'ipfs';
import { DAGNode } from 'ipld-dag-pb'
import { Unixfs } from 'ipfs-unixfs'

import { DB } from '../state/db/DB';
import {
  MarketCreatedLog
} from '../state/logs/types';

export class WarpController {
  private ipfs: IPFS;
  private static DEFAULT_NODE_TYPE = { format: 'dag-pb', hashAlg: 'sha2-256' };

  private root: DAGNode;

  get ready() {
    return this.ipfs.ready;
  }

  constructor(private db: DB) {
  }


  public async createAllCheckpoints() {
    // Goal will be to make some structure that is easy to query
    // but still matches the file interface is possible so that its
    // fetchable directly from an IPFS gateway
    //
    // TODO: Dont do this all in memory (fetch chunks)
    this.ipfs = await IPFS.create({
      EXPERIMENTAL: {
        pubsub: true
      }
    });

    // TODO: Sort this by using pouch unless
    const allDocs = await this.db.getSyncableDatabase(this.db.getDatabaseName("MarketCreated")).allDocs();
    const logs = _.sortBy(_.map(allDocs.rows, (doc) => doc.doc as MarketCreatedLog), ["blockNumber", "logIndex"])

    console.log(logs.length);

    this.root = new Unixfs('directory');
    var checkpoint = new Unixfs('file');
    var block = [];
    for (const log of logs) {
      block.push(JSON.stringify(log));
    }
    await this.addBlockToCheckpoint(block, checkpoint);
    await this.addCheckpointToRoot(checkpoint, this.root);
    const rootCID = await this.ipfs.dag.put(this.root, WarpController.DEFAULT_NODE_TYPE);

    console.log("Added root note");
    console.log(rootCID.toString());
  }


  async addCheckpointToRoot(checkpoint: Unixfs, root: Unixfs) {
      console.log("Adding checkpoint")
      const checkpointCID = await this.ipfs.dag.put(checkpoint, WarpController.DEFAULT_NODE_TYPE);

      root.addLink({
        Name: "checkpoint", // TODO: Make this the actual correct starting block number not just the first one from the group
        Hash: checkpointCID,
        Tsize: checkpoint.size
      });
  }

  async addBlockToCheckpoint(block: string[], checkpoint: Unixfs) {
    console.log("Adding block")
    const blockData = Buffer.from(block.join("\n"));
    const blockDAGNode = new DAGNode(blockData);
    const blockCID = await this.ipfs.dag.put(blockDAGNode, WarpController.DEFAULT_NODE_TYPE);
    checkpoint.addLink({
      Name: '',
      Hash: blockCID,
      Tsize: blockData.length
    });
  }
}
