# This model represents a game collection
class Collection < ApplicationRecord
  belongs_to :player
  has_and_belongs_to_many :games

  validates :name, presence: true
end
