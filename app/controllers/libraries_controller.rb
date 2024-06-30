# This controller is responsible for managing the game library
class LibrariesController < ApplicationController
  def index
    @pagy, @games = pagy(Game.all.order(:name))
  end
end
