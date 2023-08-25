import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller-toggle"
export default class extends Controller {
  static targets = ["newCelebrity", "updateCelebrity", "button"]

  connect() {
    console.log("Hello from toggle_controller.js")

  }

  fire() {
    this.newCelebrityTarget.classList.toggle("d-none");
    this.buttonTarget.classList.toggle("d-none")
    this.newCelebrityTarget.outerHTML = data.newCelebrity

  }

  update(){
    this.updateCelebrityTarget.classList.toggle("d-none");
    this.buttonTarget.classList.toggle("d-none")
    this.updateCelebrityTarget.outerHTML = data.updateCelebrity
  }

}
