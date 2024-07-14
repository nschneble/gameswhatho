# This model represents a game designer
class Designer < ApplicationRecord
  has_many :games, dependent: :destroy

  validates :name, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :website, url: { allow_nil: true }
end
