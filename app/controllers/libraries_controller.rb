# This controller is responsible for managing the game library
class LibrariesController < ApplicationController
  before_action :set_search, only: %i[index]

  def index
    if @search.present?
      @pagy, @games = pagy_searchkick(Game.pagy_search(@search))
    else
      @pagy, @games = pagy(Game.order(:name))
    end
  end

  private

  def set_search
    @search = params[:search].presence
  end
end
