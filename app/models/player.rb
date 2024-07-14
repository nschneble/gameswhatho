# This model represents a player
class Player < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :games, through: :collections

  validates :name, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex

  after_create_commit :create_default_collections

  def create_default_collections
    collections.find_or_create_by!(name: I18n.t("collection.default_name"))
    collections.find_or_create_by!(name: I18n.t("collection.default_wishlist"), wishlist: true)
  end
end
