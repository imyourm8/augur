import { Provider, Log, ParsedLog } from "..";
import { abi } from "@augurproject/artifacts";
import { Abi } from "ethereum";

export class Events {
  private readonly provider: Provider;
  private readonly augurAddress: string;
  private readonly augurTradingAddress: string;
  private readonly shareTokenAddress: string;

  private readonly eventNameToContractName = {
    "TransferSingle": "ShareToken",
    "TransferBatch": "ShareToken",
    "OrderEvent": "AugurTrading",
    "ProfitLossChanged": "AugurTrading",
    "MarketVolumeChanged": "AugurTrading"
  }

  private readonly contractAddressToName = {};

  constructor(provider: Provider, augurAddress: string, augurTradingAddress: string, shareTokenAddress: string) {
    this.provider = provider;
    this.augurAddress = augurAddress;
    this.augurTradingAddress = augurTradingAddress;
    this.shareTokenAddress = shareTokenAddress;
    this.provider.storeAbiData(abi.Augur as Abi, "Augur");
    this.provider.storeAbiData(abi.AugurTrading as Abi, "AugurTrading");
    this.provider.storeAbiData(abi.ShareToken as Abi, "ShareToken");
    this.contractAddressToName[this.augurAddress] = "Augur";
    this.contractAddressToName[this.augurTradingAddress] = "AugurTrading";
    this.contractAddressToName[this.shareTokenAddress] = "ShareToken";
  }

  async getLogs(eventName: string, fromBlock: number, toBlock: number | "latest", additionalTopics?: Array<string | string[]>): Promise<ParsedLog[]> {
    let topics: Array<string | string[]> = this.getEventTopics(eventName);
    if (additionalTopics) {
      topics = topics.concat(additionalTopics);
    }
    const logs = await this.provider.getLogs({ fromBlock, toBlock, topics, address: this.getEventContractAddress(eventName) });
    return this.parseLogs(logs);
  }

  getEventContractName = (eventName: string) => {
    const contractName = this.eventNameToContractName[eventName];
    return contractName || "Augur";
  }

  getEventContractAddress = (eventName: string) => {
    const contractName = this.getEventContractName(eventName);
    if (contractName == "ShareToken") return this.shareTokenAddress;
    if (contractName == "AugurTrading") return this.augurTradingAddress;
    return this.augurAddress;
  }

  getEventTopics = (eventName: string) => {
    return [this.provider.getEventTopic(this.getEventContractName(eventName), eventName)];
  };

  parseLogs = (logs: Log[]): ParsedLog[] => {
    return logs.map((log) => {
      const logValues = this.provider.parseLogValues(this.contractAddressToName[log.address], log);
      return Object.assign(
        { name: "" },
        logValues,
        {
          blockNumber: log.blockNumber,
          blockHash: log.blockHash,
          transactionIndex: log.transactionIndex,
          removed: log.removed,
          transactionLogIndex: log.transactionLogIndex,
          transactionHash: log.transactionHash,
          logIndex: log.logIndex,
          topics: log.topics,
        }
      );
    });
  }
}
