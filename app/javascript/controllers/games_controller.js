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

        modal.querySelector("[data-name]").textContent = game.emoji + " " + game.display_name
        modal.querySelector("[data-players]").textContent = game.number_of_players
        modal.querySelector("[data-length]").textContent = game.game_length_in_minutes
        modal.querySelector("[data-bgg-name]").textContent = game.display_name
        modal.querySelector("[data-bgg-url]").setAttribute("href", game.bgg_url)
        modal.querySelector("[data-designer-name]").textContent = game.designer_name
        modal.querySelector("[data-designer-url]").setAttribute("href", game.designer_website)

        if (game.base_game !== null) {
          modal.querySelector("[data-base-game-wrapper]").classList.remove("hidden")
          modal.querySelector("[data-base-game]").textContent = game.base_game
        } else {
          modal.querySelector("[data-base-game-wrapper]").classList.add("hidden")
        }

        if (game.expansions !== null) {
          modal.querySelector("[data-expansions-wrapper]").classList.remove("hidden")
          modal.querySelector("[data-expansions]").textContent = game.expansions
        } else {
          modal.querySelector("[data-expansions-wrapper]").classList.add("hidden")
        }

        modal.showModal()

        document.addEventListener("click", closeModal)
      })
      .catch((error) => {
        alert(error)
      })
  }
}

function closeModal(event) {
  const target = event.target
  if (target.matches(".button-close-modal") || target.matches(".button-close-modal > span") || !target.closest(".modal")) {
    const modal = document.querySelector("dialog")
    modal.close()
    document.removeEventListener("click", closeModal)
  }
}
