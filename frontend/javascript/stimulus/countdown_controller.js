import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["days"];

  static values = {
    targetDate: String,
  };

  connect() {
    this.setDaysTarget();

    setInterval(function () {
      this.setDaysTarget();
    }, 300000);
  }

  setDaysTarget() {
    this.daysTarget.innerHTML = this.daysUntil(this.targetDateValue);
  }

  daysUntil(date) {
    var currentDate = new Date();
    var futureDate = this.nextOccurrence(date);

    var timeDiff = futureDate.getTime() - currentDate.getTime();
    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
    return diffDays;
  }

  nextOccurrence(date) {
    var currentDate = new Date();
    var dateArray = date.split(" ");
    var months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    var month = months.indexOf(dateArray[0]) + 1;
    var day = dateArray[1];
    var nextOccurrence = new Date(currentDate.getFullYear(), month - 1, day);
    if (nextOccurrence < currentDate) {
      nextOccurrence.setFullYear(nextOccurrence.getFullYear() + 1);
    }
    return nextOccurrence;
  }
}
