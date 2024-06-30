import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="games"
export default class extends Controller {
  connect() {
    document.addEventListener("click", function(event) {
      if (!event.target.closest("#gameModal")) {
        const modal = document.querySelector("dialog");
        modal.close();
      }
    });
  }

  // Fetches the JSON data for a board game
  show(event) {
    const id = this.data.get("id");

    fetch(`/games/${id}.json`)
      .then((response) => {
        if (!response.ok) {
          const status = response.status;
          const httpStatusUrl = `https://httpstatuses.io/${status}`;

          throw new Error(`Couldn't retrieve board game details. ` +
            `The server returned an HTTP status of <a href="${httpStatusUrl}" target="_blank">${status}</a>`);
        }
        return response.json();
      })
      .then((data) => {
        const modal = document.querySelector("dialog");
        const game = data.game;

        modal.querySelector("[data-name]").textContent = game.name
        modal.querySelector("[data-players]").textContent = game.number_of_players
        modal.querySelector("[data-length]").textContent = game.game_length_in_minutes
        modal.querySelector("[data-designer]").textContent = game.designer_name
        modal.querySelector("[data-designer]").setAttribute("href", game.designer_website);

        modal.showModal();
      })
      .catch((error) => {
        alert(error);
      });
  }
}
