# This model represents a board game
class Game < ApplicationRecord
  belongs_to :base_game, class_name: "Game", optional: true
  belongs_to :designer
  has_and_belongs_to_many :collections
  has_many :players, through: :collections
  has_many :expansions, class_name: "Game", foreign_key: "base_game_id", inverse_of: "base_game", dependent: :destroy

  extend Pagy::Searchkick
  include RangeUtils

  searchkick

  validates :name, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :slug, uniqueness: true, format: { with: /\A[a-zA-Z0-9\-]+\z/, message: I18n.t("validations.game.slug") } # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :emoji, presence: true
  validates :bgg_url, url: { allow_nil: true }
  validates :play_count, range: true
  validates :play_time, range: { allow_infinity: true }

  scope :versus, -> { where("games.play_count @> 2") }
  scope :speedy, -> { where("upper(games.play_time) <= 31").or(where("lower(games.play_time) <= 31 AND upper_inf(games.play_time)")) }
  scope :sorted, lambda {
    joins("LEFT JOIN games AS base_games ON games.base_game_id = base_games.id")
      .order(Arel.sql("COALESCE(base_games.name || games.name, games.name)"))
  }

  GAME_LENGTH_IN_MIN = {
    short: 31,
    medium: 61
  }.freeze

  def self.valid_scope?(scope)
    send(:generated_relation_methods).instance_methods.include? scope.to_sym
  end

  def expansion?
    base_game.present?
  end

  def expansions?
    expansions.any?
  end

  def exp(name)
    expansions.find_by(name:)
  end

  def display_name
    return "#{base_game.name}: #{name}" if expansion?

    name
  end

  def number_of_players
    format_range(play_count) if play_count.present?
  end

  def game_length_in_minutes
    "#{format_range(play_time)} #{I18n.t('games.min')}" if play_time.present?
  end

  def short?
    play_time.present? && highest(play_time) <= GAME_LENGTH_IN_MIN[:short]
  end

  def medium?
    play_time.present? && highest(play_time) <= GAME_LENGTH_IN_MIN[:medium]
  end

  def long?
    play_time.present? && highest(play_time) > GAME_LENGTH_IN_MIN[:medium]
  end

  # Searchkick guidance
  # https://gist.github.com/JasonTrue/3cd6a7094e23cd72bfb870604521f415#indexing
  def search_data
    {
      name:,
      base_game:,
      designer: designer.name
    }
  end

  def self.empty
    Game.new(
      name: I18n.t("empty.message"),
      designer: Designer.new(
        name: I18n.t("empty.suggestion")
      )
    )
  end

  def empty?
    name.eql?(I18n.t("empty.message")) && designer.name.eql?(I18n.t("empty.suggestion"))
  end
end
