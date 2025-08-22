import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    console.log(this.element)
    setTimeout(() => {
      this.element.remove() // remove from DOM after fade
    }, 5000); // 5 seconds
  }

  close() {
    this.element.remove()
  }
}
