# This model represents a board game
class Game < ApplicationRecord
  belongs_to :designer
  has_and_belongs_to_many :collections
  has_many :players, through: :collections

  extend Pagy::Searchkick
  include RangeUtils

  searchkick

  GAME_LENGTH_IN_MIN = {
    short: 30,
    medium: 60
  }.freeze

  def number_of_players
    return if play_count.nil?

    format_range(play_count)
  end

  def game_length_in_minutes
    return if play_time.nil?

    "#{format_range(play_time)} #{I18n.t('games.min')}"
  end

  def short?
    return false if play_time.nil?

    play_time.end.to_i <= GAME_LENGTH_IN_MIN[:short]
  end

  def medium?
    return false if play_time.nil?

    play_time.end.to_i <= GAME_LENGTH_IN_MIN[:medium]
  end

  def long?
    return false if play_time.nil?

    play_time.end.to_i > GAME_LENGTH_IN_MIN[:medium]
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
