import "$styles/index.css";
import Alpine from "alpinejs";

import { loadSavvyCal, initSavvyCal, loadHeapAnalytics } from "$javascript/thirdPartyScripts";
import twitterEmbed from "$javascript/alpine/twitterEmbed";

if (process.env.NODE_ENV !== "production") {
  loadHeapAnalytics("1874465280");
} else {
  loadHeapAnalytics("1399095330");
}

loadSavvyCal().then(() => {
  initSavvyCal();

  window.addEventListener("savvycal.scheduled", () => {
    // Sessions are generally worth $500, unless someone books a 2-hour slot.
    // window.fathom.trackGoal("DBSMY0WK", 50000);
  });
});

Alpine.data('twitterEmbed', twitterEmbed);
Alpine.start();

// Import all JavaScript & CSS files from src/_components
import components from "$components/**/*.{js,jsx,js.rb,css}";

