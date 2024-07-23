import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  search() {
    const searchQuery = document.querySelector(`input[name="search"]`).value
    if (searchQuery === "") {
      const pageTitle = this.data.get("pageTitle")
      document.title = pageTitle
    } else {
      const searchTitle = this.data.get("searchTitle")
      document.title = searchTitle + searchQuery
    }

    this.dispatch("reset")

    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 200)
  }
}
