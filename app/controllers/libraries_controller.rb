# This controller is responsible for managing the game library
class LibrariesController < ApplicationController
  def index
    @games = Game.all.sort_by(&:name)
  end
end
