# This controller is responsible for managing the game library
class LibrariesController < ApplicationController
  def index
    @pagy, @games = pagy(Game.order(:name))
  end
end
