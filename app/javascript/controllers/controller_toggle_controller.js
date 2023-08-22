import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller-toggle"
export default class extends Controller {
  static targets = ["newCelebrity"]

  connect() {
    console.log("Hello from toggle_controller.js")

  }

  fire() {
    this.newCelebrityTarget.classList.toggle("d-none");
    this.newCelebrityTarget.outerHTML = data.newCelebrity
  }

}
