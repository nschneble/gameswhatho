# This model represents a board game
class Game < ApplicationRecord
  belongs_to :designer
  has_and_belongs_to_many :collections
  has_many :players, through: :collections

  include RangeUtils

  GAME_LENGTH_IN_MIN = {
    short: 30,
    medium: 60
  }

  def number_of_players
    format_range(play_count)
  end

  def game_length_in_minutes
    "#{format_range(play_time)} #{I18n.t('games.min')}"
  end

  def short?
    play_time.end.to_i <= GAME_LENGTH_IN_MIN[:short]
  end

  def medium?
    play_time.end.to_i <= GAME_LENGTH_IN_MIN[:medium]
  end

  def long?
    play_time.end.to_i > GAME_LENGTH_IN_MIN[:medium]
  end
end
