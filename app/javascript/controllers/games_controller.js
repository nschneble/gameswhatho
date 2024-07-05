import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="games"
export default class extends Controller {
  show() {
    const id = this.data.get("id")
    fetch(`/games/${id}.json`)
      .then((response) => {
        if (!response.ok) {
          throw new Error(`Couldn't retrieve board game details`)
        }
        return response.json()
      })
      .then((data) => {
        const modal = document.querySelector("dialog")
        const game = data.game

        modal.querySelector("[data-name]").textContent = game.name
        modal.querySelector("[data-players]").textContent = game.number_of_players
        modal.querySelector("[data-length]").textContent = game.game_length_in_minutes
        modal.querySelector("[data-designer]").textContent = game.designer_name
        modal.querySelector("[data-designer]").setAttribute("href", game.designer_website)
        modal.showModal()

        document.addEventListener("click", closeModal)
      })
      .catch((error) => {
        alert(error)
      })
  }
}

function closeModal(event) {
  if (event.target.matches(".button-close-modal") || !event.target.closest(".modal")) {
    const modal = document.querySelector("dialog")
    modal.close()
    document.removeEventListener("click", closeModal)
  }
}
