# This model represents a player
class Player < ApplicationRecord
  has_many :collections
  has_many :games, through: :collections
end
