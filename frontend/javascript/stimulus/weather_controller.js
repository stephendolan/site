import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["output"];

  static values = {
    url: String,
  };

  connect() {
    this.loadingDots = ".";
    this.startLoadingState();

    this.populateWeather();

    setInterval(function () {
      this.startLoadingState();
      this.populateWeather();
    }, 300000);
  }

  startLoadingState() {
    this.intervalId = setInterval(() => {
      this.updateLoadingText();
    }, 500);
  }

  updateLoadingText() {
    let loadingText = "Loading weather";

    this.outputTarget.innerHTML = loadingText + this.loadingDots;

    if (this.loadingDots.length < 3) {
      this.loadingDots += ".";
    } else {
      this.loadingDots = ".";
    }

    return;
  }

  populateWeather() {
    fetch(this.urlValue)
      .then((result) => result.text())
      .then((data) => {
        clearInterval(this.intervalId);
        this.outputTarget.innerHTML = data;
      })
      .catch((error) => {
        this.outputTarget.innerHTML = `Encountered an error: ${error}`;
      });
  }
}
