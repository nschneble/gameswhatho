import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sort"
export default class extends Controller {
  change() {
    const column = event.target.getAttribute("data-column")
    const sortab = event.target.getAttribute("data-sortab")

    const sortabInput = document.querySelector(`input[name="sortab"]`)
    const button = document.querySelector(`.button-sort-${column}`)

    if (button.classList.contains("active")) {
      const ascending = sortab.endsWith("asc")

      sortabInput.setAttribute("value", `${column}_${ascending ? "dsc" : "asc"}`)
      button.querySelector("span.float-end").textContent = ascending ? "↑" : "↓"
    } else {
      sortabInput.setAttribute("value", `${column}_asc`)

      const columns = ["title", "times", "count"]
      columns.forEach((name) => toggleStyles(`.button-sort-${name}`, column === name))
    }

    this.element.requestSubmit()
  }
}

function toggleStyles(selector, alwaysToggle = false) {
  const button = document.querySelector(selector)
  if (button.classList.contains("active") || alwaysToggle) {
    button.classList.toggle("text-gray-700")
    button.classList.toggle("active")
    button.classList.toggle("text-gray-500")
    button.classList.toggle("hover:text-gray-600")
    button.classList.toggle("active:text-gray-700")
  }

  if (button.classList.contains("active")) {
    button.querySelector("span.float-end").textContent = "↓"
  } else {
    button.querySelector("span.float-end").textContent = ""
  }
}
