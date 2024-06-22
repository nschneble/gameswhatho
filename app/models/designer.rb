# This model represents a game designer
class Designer < ApplicationRecord
  has_many :games, dependent: :destroy
end
