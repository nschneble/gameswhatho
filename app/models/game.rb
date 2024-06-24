# This model represents a board game
class Game < ApplicationRecord
  belongs_to :designer
  has_and_belongs_to_many :collections
  has_many :players, through: :collections

  def number_of_players
    "#{play_count.begin.to_i} - #{play_count.end.to_i}"
  end

  def game_length_in_minutes
    "#{play_time.begin.to_i} - #{play_time.end.to_i} #{I18n.t('games.min')}"
  end
end
