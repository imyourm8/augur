import * as _ from 'lodash';
import * as IPFS from 'ipfs';

import { DB } from '../state/db/DB';


export class WarpController {
  private ipfs: IPFS;

  private root: any = {
    Links: [],
    Data: ''
  }

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
    const logs = _.sortBy(await this.db.findMarketCreatedLogs({
      selector: {}
    }), ["blockNumber", "logIndex"]);


    console.log(logs.length)

    var checkpoints = [];
    var checkpoint = [];
    var block = [];
    for (const log of logs) {
      // TODO: Make this the right starting block number
      if (checkpoint.length > 0 && log.blockNumber > _.first(checkpoint).blockNumber - 1000) {
        console.log("Adding checkpoint")
        const checkpointSize = _.sumBy(checkpoint, 'Size');
        const checkpointCID = await this.ipfs.dag.put(checkpoint);
        checkpoints.push({
          Name: "check-${checkpoint[0].blockNumber}", // TODO: Make this the actual correct starting block number not just the first one from the group
          Hash: checkpointCID,
          Size: checkpointSize
        })
        checkpoint = []
      }

      if (block.length !== 0 && log.blockNumber !== block[0].blockNumber) {
        console.log("Adding block")
        const blockData = new Buffer(JSON.stringify(block));
        const blockCID = await this.ipfs.block.put(blockData);
        checkpoint.push(blockCID);
        block = [];
      }
      block.push(log);
    }

    console.log("Adding all")
    console.log(this.ipfs);
    const checkpointsCID = await this.ipfs.dag.put({
      Links: checkpoints,
      Data: ""
    });

    console.log(checkpointsCID);
  }
}
