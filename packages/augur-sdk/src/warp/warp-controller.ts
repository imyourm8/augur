import * as _ from 'lodash';
import * as IPFS from 'ipfs';
import { DAGNode } from 'ipld-dag-pb'

import { DB } from '../state/db/DB';
import {
  MarketCreatedLog
} from '../state/logs/types';

/**
 * Options for the libp2p bundle
 * @typedef {Object} libp2pBundle~options
 * @property {PeerInfo} peerInfo - The PeerInfo of the IPFS node
 * @property {PeerBook} peerBook - The PeerBook of the IPFS node
 * @property {Object} config - The config of the IPFS node
 * @property {Object} options - The options given to the IPFS node
 */

/**
 * This is the bundle we will use to create our fully customized libp2p bundle.
 *
 * @param {libp2pBundle~options} opts The options to use when generating the libp2p node
 * @returns {Libp2p} Our new libp2p node
 */
const libp2pBundle = (opts) => {
  // Set convenience variables to clearly showcase some of the useful things that are available
  const peerInfo = opts.peerInfo
  const peerBook = opts.peerBook
  const bootstrapList = opts.config.Bootstrap

  // Create our WebSocketStar transport and give it our PeerId, straight from the ipfs node
  const wsstar = new WebSocketStar({
    id: peerInfo.id
  })

  // Build and return our libp2p node
  return new Libp2p({
    peerInfo,
    peerBook,
    // Lets limit the connection managers peers and have it check peer health less frequently
    connectionManager: {
      minPeers: 25,
      maxPeers: 100,
      pollInterval: 5000
    },
    modules: {
      transport: [
        TCP,
        wsstar
      ],
      streamMuxer: [
        MPLEX,
        SPDY
      ],
      connEncryption: [
        SECIO
      ],
      peerDiscovery: [
        MulticastDNS,
        Bootstrap,
        wsstar.discovery
      ],
      dht: KadDHT
    },
    config: {
      peerDiscovery: {
        autoDial: true, // auto dial to peers we find when we have less peers than `connectionManager.minPeers`
        mdns: {
          interval: 10000,
          enabled: true
        },
        bootstrap: {
          interval: 30e3,
          enabled: true,
          list: bootstrapList
        }
      },
      // Turn on relay with hop active so we can connect to more peers
      relay: {
        enabled: true,
        hop: {
          enabled: true,
          active: true
        }
      },
      dht: {
        enabled: true,
        kBucketSize: 20,
        randomWalk: {
          enabled: true,
          interval: 10e3, // This is set low intentionally, so more peers are discovered quickly. Higher intervals are recommended
          timeout: 2e3 // End the query quickly since we're running so frequently
        }
      },
      pubsub: {
        enabled: true
      }
    }
  })
}

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

    this.root = new DAGNode('\u0008\u0002\u0012\u0006master\u0018\u0006');
    var checkpoint = new DAGNode('');
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


  async addCheckpointToRoot(checkpoint: DAGNode, root: DAGNode) {
      console.log("Adding checkpoint")
      const checkpointCID = await this.ipfs.dag.put(checkpoint, WarpController.DEFAULT_NODE_TYPE);

      root.addLink({
        Name: "checkpoint", // TODO: Make this the actual correct starting block number not just the first one from the group
        Hash: checkpointCID,
        Tsize: checkpoint.size
      });
  }

  async addBlockToCheckpoint(block: string[], checkpoint: DAGNode) {
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
