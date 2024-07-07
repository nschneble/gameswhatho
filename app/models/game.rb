# This model represents a board game
class Game < ApplicationRecord
  belongs_to :designer
  has_and_belongs_to_many :collections
  has_many :players, through: :collections

  extend Pagy::Searchkick
  include RangeUtils

  searchkick

  GAME_LENGTH_IN_MIN = {
    short: 31,
    medium: 61
  }.freeze

  def number_of_players
    format_range(play_count) if play_count.present?
  end

  def game_length_in_minutes
    "#{format_range(play_time)} #{I18n.t('games.min')}" if play_time.present?
  end

  def short?
    play_time.present? && highest(play_time) <= GAME_LENGTH_IN_MIN[:short]
  end

  def medium?
    play_time.present? && highest(play_time) <= GAME_LENGTH_IN_MIN[:medium]
  end

  def long?
    play_time.present? && highest(play_time) > GAME_LENGTH_IN_MIN[:medium]
  end

  # Searchkick guidance
  # https://gist.github.com/JasonTrue/3cd6a7094e23cd72bfb870604521f415#indexing
  def search_data
    {
      name:,
      designer: designer.name
    }
  end

  def self.empty
    Game.new(
      name: I18n.t("empty.message"),
      designer: Designer.new(
        name: I18n.t("empty.suggestion")
      )
    )
  end

  def empty?
    name.eql?(I18n.t("empty.message")) && designer.name.eql?(I18n.t("empty.suggestion"))
  end
end
