# This model represents a player
class Player < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :games, through: :collections
end
