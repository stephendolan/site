import { loadTwitter } from "$javascript/thirdPartyScripts";

export default () => ({
  init() {
    loadTwitter();
  }
})