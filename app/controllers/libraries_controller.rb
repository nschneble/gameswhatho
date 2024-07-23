# This controller is responsible for managing the game library
class LibrariesController < ApplicationController
  before_action :set_filter, only: %i[index]
  before_action :set_search, only: %i[index]

  def index
      @pagy, @games = pagy(Game.send(@filter.to_sym).sorted)
    if @filter.present?
    elsif @search.present?
      @pagy, @games = pagy_searchkick(Game.pagy_search(@search))
    else
      @pagy, @games = pagy(Game.sorted)
    end
  end

  private

  def set_filter
    @filter = params[:filter] if Game.valid_scope?(params[:filter])
  end

  def set_search
    @search = params[:search].presence
  end
end
