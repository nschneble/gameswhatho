# This controller is responsible for managing the game library
class LibrariesController < ApplicationController
  before_action :set_filter, only: %i[index]
  before_action :set_search, only: %i[index]

  def index
    if @filter.present? && Game.valid_scope?(@filter)
      @pagy, @games = pagy(Game.send(@filter.to_sym).sorted)
    elsif @search.present?
      @pagy, @games = pagy_searchkick(Game.pagy_search(@search))
    else
      @pagy, @games = pagy(Game.sorted)
    end
  end

  private

  def set_filter
    @filter = params[:filter].presence
  end

  def set_search
    @search = params[:search].presence
  end
end
