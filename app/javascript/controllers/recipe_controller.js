import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recipe"
export default class extends Controller {
  static targets = ["description", "ingredients"]
  static classes = ["hidden"]

  toggle() {
    this.descriptionTarget.classList.toggle(this.hiddenClass)
    this.ingredientsTarget.classList.toggle(this.hiddenClass)
  }
}
