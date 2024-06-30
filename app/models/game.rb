# This model represents a board game
class Game < ApplicationRecord
  belongs_to :designer
  has_and_belongs_to_many :collections
  has_many :players, through: :collections

  include RangeUtils

  def number_of_players
    format_range(play_count)
  end

  def game_length_in_minutes
    "#{format_range(play_time)} #{I18n.t('games.min')}"
  end
end
