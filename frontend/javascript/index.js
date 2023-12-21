import "$styles/index.css";
import Alpine from "alpinejs";
import { Application } from "@hotwired/stimulus"

import { loadAnalytics } from "$javascript/thirdPartyScripts";
import twitterEmbed from "$javascript/alpine/twitterEmbed";
import weatherController from "$javascript/stimulus/weather_controller.js";
import countdownController from "$javascript/stimulus/countdown_controller.js";

if (process.env.NODE_ENV === "production") {
  loadAnalytics();
}

Alpine.data('twitterEmbed', twitterEmbed);
Alpine.start();

window.Stimulus = Application.start()
Stimulus.register('weather', weatherController);
Stimulus.register('countdown', countdownController);

// Import all JavaScript & CSS files from src/_components
import components from "$components/**/*.{js,jsx,js.rb,css}";

