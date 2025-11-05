import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="template"
export default class extends Controller {
  static targets = ["container", "template"];

  add(event) {
    const clone = this.templateTarget.content.cloneNode(true);
    const index = this.containerTarget.querySelectorAll("div").length;

    const inputs = clone.querySelectorAll("input");
    inputs.forEach((input) => {
      input.name = input.name.replace("NEW_RECORD", index);
    });

    this.containerTarget.appendChild(clone);
  }

  delete(event) {
    const passengerDiv = event.target.closest("div");

    const count = this.containerTarget.querySelectorAll("div").length;

    if (count > 1) {
      passengerDiv.remove();
    }
  }
}
