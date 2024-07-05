import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submission"
export default class extends Controller {
  search() {
    const searchQuery = document.querySelector("input").value
    if (searchQuery === "") {
      const pageTitle = this.data.get("pageTitle")
      document.title = pageTitle
    } else {
      const searchTitle = this.data.get("searchTitle")
      document.title = searchTitle + searchQuery
    }

    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 200)
  }
}
