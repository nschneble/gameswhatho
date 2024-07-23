# This controller is responsible for managing the game library
class LibrariesController < ApplicationController
  before_action :set_filter, only: %i[index]
  before_action :set_search, only: %i[index]
  before_action :set_sortab, only: %i[index]

  def index
    if @filter.present?
      @pagy, @games = pagy(Game.send(@filter.to_sym).send(@sortab.to_sym))
    elsif @search.present?
      @pagy, @games = pagy_searchkick(Game.pagy_search(@search))
    else
      @pagy, @games = pagy(Game.send(@sortab.to_sym))
    end
  end

  private

  def set_filter
    @filter = params[:filter] if Game.valid_scope?(params[:filter])
  end

  def set_search
    @search = params[:search].presence
  end

  def set_sortab
    @sortab = params[:sortab] if Game.valid_scope?(params[:sortab])
    @sortab ||= "title_asc"
  end
end
