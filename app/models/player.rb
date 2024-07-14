# This model represents a player
class Player < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :games, through: :collections

  validates :name, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex

  after_create_commit :create_default_collection

  def create_default_collection
    collections.find_or_create_by!(name: I18n.t("collection.default_name"))
  end
end
