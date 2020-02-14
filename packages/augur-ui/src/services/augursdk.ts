import { NetworkId, getAddressesForNetwork } from '@augurproject/artifacts';
import {
  Augur,
  CalculateGnosisSafeAddressParams,
  Connectors,
  createClient,
  SDKConfiguration,
  NULL_ADDRESS,
  GnosisSafeInputs
} from '@augurproject/sdk';
import { EthersSigner } from 'contract-dependencies-ethers';
import { formatBytes32String } from 'ethers/utils';
import { JsonRpcProvider } from 'ethers/providers';
import {
  listenToUpdates,
  unListenToEvents,
} from 'modules/events/actions/listen-to-updates';
import { EnvObject } from 'modules/types';
import { isEmpty } from 'utils/is-empty';
import { analytics } from './analytics';
import { isLocalHost } from 'utils/is-localhost';
import { createBrowserMesh } from './browser-mesh';
import { EthersProvider } from '@augurproject/ethersjs-provider';
import { getFingerprint } from 'utils/get-fingerprint';

export class SDK {
  client: Augur | null = null;
  isSubscribed = false;
  networkId: NetworkId;
  private signerNetworkId: string;
  private connector:Connectors.BaseConnector;
  private config: SDKConfiguration;


  // Keeping this here for backward compatibility
  get sdk() {
    return this.client;
  }

  connect(account: string = null):Promise<void> {
    return this.connector.connect(this.config, account);
  }

  async makeClient(
    provider: JsonRpcProvider,
    env: EnvObject,
    signer: EthersSigner = undefined,
    account: string = null,
    enableFlexSearch = true,
  ): Promise<Augur> {
    this.networkId = (await provider.getNetwork()).chainId.toString() as NetworkId;
    const addresses = getAddressesForNetwork(this.networkId);

    this.config = {
      networkId: this.networkId,
      ethereum: env['ethereum'],
      gnosis: env['gnosis'],
      zeroX: env['zeroX'],
      addresses,
    };

    const ethersProvider = new EthersProvider(
      provider,
      this.config.ethereum.rpcRetryCount,
      this.config.ethereum.rpcRetryInterval,
      this.config.ethereum.rpcConcurrency
    );

    if (this.config.sdk && this.config.sdk.enabled) {
      this.connector = new Connectors.WebsocketConnector();
    } else {
      this.connector = new Connectors.SingleThreadConnector();
    }

    this.client = await createClient(this.config, this.connector, account, signer, ethersProvider, enableFlexSearch, createBrowserMesh);

    if (!isEmpty(account)) {
      this.syncUserData(account, signer, this.networkId, this.config.gnosis && this.config.gnosis.enabled).catch((error) => {
        console.log('Gnosis safe create error during create: ', error);
      });
    }

    // tslint:disable-next-line:ban-ts-ignore
    // @ts-ignore
    window.AugurSDK = this.client;
    return this.client;
  }

  /**
   * @name retrieveOrCreateGnosisSafe
   * @description - Kick off the Gnosis safe creation process for a given wallet address.
   * @param {string} owner - Wallet address
   * @returns {Promise<void>}
   */
  async retrieveOrCreateGnosisSafe(owner: string, networkId: NetworkId, affiliate: string = NULL_ADDRESS): Promise<void | string> {
    if (!this.client) {
      console.log('Trying to init gnosis safe before Augur is initalized');
      return;
    }

    const gnosisLocalstorageItemKey = `gnosis-relay-request-${networkId}-${owner}`;
    const fingerprint = getFingerprint();
    let calculateGnosisSafeAddressParams: GnosisSafeInputs = { owner, affiliate, fingerprint };
    // Up to UI side to check the localstorage wallet matches the wallet address.
    const calculateGnosisSafeAddressParamsString = localStorage.getItem(
      gnosisLocalstorageItemKey
    );

    if (calculateGnosisSafeAddressParamsString) {
      calculateGnosisSafeAddressParams = JSON.parse(
        calculateGnosisSafeAddressParamsString
      ) as GnosisSafeInputs;
    }

    const safe = await this.client.gnosis.getOrCreateGnosisSafe(calculateGnosisSafeAddressParams);
    // Write response to localstorage.
    localStorage.setItem(gnosisLocalstorageItemKey, JSON.stringify(calculateGnosisSafeAddressParams));
    return safe;
  }

  async syncUserData(
    account: string,
    signer: EthersSigner,
    expectedNetworkId: NetworkId,
    useGnosis: boolean,
    affiliate?: string,
    updateUser?: Function
  ) {
    if (!this.client) {
      throw new Error('Trying to sync user data before Augur is initialized');
    }

    if (expectedNetworkId && this.networkId !== expectedNetworkId) {
      throw new Error(`Setting the current user is expecting to be on network ${expectedNetworkId} but Augur was already connected to ${this.networkId}`);
    }

    if (!signer) {
      throw new Error('Attempting to set logged in user without specifying a signer');
    }

    this.client.signer = signer;

    if (useGnosis) {
      account = await this.retrieveOrCreateGnosisSafe(
        account,
        this.networkId,
        affiliate
      ) as string;

      this.client.setUseGnosisSafe(true);
      this.client.setUseGnosisRelay(true);
      this.client.setGnosisSafeAddress(account);
      if (!!updateUser) {
        updateUser(account);
      }
    }

    if (!isLocalHost()) {
      analytics.identify(account, { networkId: this.networkId, useGnosis });
    }
  }

  async destroy() {
    unListenToEvents(this.client);
    this.isSubscribed = false;
    this.client = null;
  }

  get(): Augur {
    if (this.client) {
      return this.client;
    }
    throw new Error('API must be initialized before use.');
  }

  ready(): boolean {
    if (this.client) return true;
    return false;
  }

  subscribe(dispatch): void {
    if (this.isSubscribed) return;
    try {
      this.isSubscribed = true;
      console.log('Subscribing to Augur events');
      dispatch(listenToUpdates(this.get()));
    } catch (e) {
      this.isSubscribed = false;
    }
  }
}

export const augurSdk = new SDK();
