import * as _ from 'lodash';
import * as IPFS from 'ipfs';
import { DAGNode } from 'ipld-dag-pb';
import * as Unixfs from 'ipfs-unixfs';

import { DB } from '../state/db/DB';
import {
  MarketCreatedLog
} from '../state/logs/types';

export class WarpController {
  private ipfs: IPFS;
  private static DEFAULT_NODE_TYPE = { format: 'dag-pb', hashAlg: 'sha2-256' };
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
    this.ipfs = await IPFS.create();

    // TODO: Sort this by using pouch unless
    const allDocs = await this.db.getSyncableDatabase(this.db.getDatabaseName("MarketCreated")).allDocs();
    const logs = _.sortBy(_.map(allDocs.rows, (doc) => doc.doc as MarketCreatedLog), ["blockNumber", "logIndex"])

    console.log(logs.length);

    var block = [];
    for (const log of logs) {
      block.push(JSON.stringify(log));
    }
    const files = await this.addBlock(block);
    console.log(files);

    const o = await this.ipfs.object.get(files[0].hash);
    console.log(o);

    var unmarshaled = Unixfs.unmarshal(o.Data);
    console.log(unmarshaled);

    const d = await this.ipfs.object.get(o.Links[0].Hash);
    unmarshaled = Unixfs.unmarshal(d.Data);
    console.log(unmarshaled);
    console.log(unmarshaled.data.toString())



    console.log("PART DUEX");

    const part2 = await this.ipfs.add([{
      path: '/augur-two/paul',
      content: Buffer.from("Paul is great")
    }, {
      path: '/augur-two/justin',
      content: Buffer.from("And I would also say that justin is also AMAZING!!!!")
    }]);

    const file = Unixfs.default('file');
    file.addBlockSize(part2[0].size);
    file.addBlockSize(part2[1].size);

    const omnibus = new DAGNode(file.marshal());
    omnibus.addLink({
      Hash: part2[0].hash,
      Size: part2[0].size
    });
    omnibus.addLink({
      Hash: part2[1].hash,
      Size: part2[1].size
    });

    const r = await this.ipfs.dag.put(omnibus, WarpController.DEFAULT_NODE_TYPE);
    console.log(r.toString());
  }


  async addBlock(block: string[]) {
    console.log("Adding block")
    const blockData = Buffer.from(block.join("\n"));
    return await this.ipfs.add([{
      path: '/augur-warp/chunk1',
      content: blockData
    }, {
      path: '/augur-warp/chunk2',
      content: blockData.slice(0,10005)
    }], {
      chunker: 'size-10000'
    });
  }
}
