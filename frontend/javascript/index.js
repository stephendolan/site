import "$styles/index.css";
import Alpine from "alpinejs";

// Optional, but can be useful for debugging.
// window.Alpine = Alpine

Alpine.start();

// Import all JavaScript & CSS files from src/_components
import components from "$components/**/*.{js,jsx,js.rb,css}";

window.addEventListener("savvycal.scheduled", () => {
  // Sessions are generally worth $500, unless someone books a 2-hour slot.
  window.fathom.trackGoal("DBSMY0WK", 50000);
});
