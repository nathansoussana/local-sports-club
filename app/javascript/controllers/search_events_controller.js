import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-events"
export default class extends Controller {
  static targets = ["form", "input", "list"];
  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.listTarget);
    console.log(this.formTarget);
  }

  update() {
    const url = `${this.formTarget.action}?search%5Bquery%5D=${this.inputTarget.value}&commit=Search`;
    fetch(url, { headers: { Accept: "text/plain" } })
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      });
  }
}
