import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  change() {
    const filter = event.target.getAttribute("data-filter")
    const button = document.querySelector(`.button-filter-${filter}`)

    if (!button.classList.contains("active")) {
      const pageTitle = this.data.get(filter === "sorted" ? "pageTitle" : "filterTitle")
      document.title = pageTitle + (filter === "sorted" ? "" : button.textContent)

      const filters = ["sorted", "versus", "speedy"]
      filters.forEach((name) => toggleStyles(`.button-filter-${name}`, filter === name))

      const input = document.querySelector(`input[name="filter"]`)
      input.setAttribute("value", filter)
      this.element.requestSubmit()
    }
  }
}

function toggleStyles(selector, alwaysToggle) {
  const button = document.querySelector(selector)
  if (button.classList.contains("active") || alwaysToggle) {
    button.classList.toggle("text-white")
    button.classList.toggle("bg-blue-600")
    button.classList.toggle("cursor-default")
    button.classList.toggle("active")
    button.classList.toggle("text-gray-700")
    button.classList.toggle("active:text-gray-800")
    button.classList.toggle("hover:bg-gray-100")
    button.classList.toggle("active:bg-gray-200")
  }
}
