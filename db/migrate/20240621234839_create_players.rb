# This migration creates all of our tables and relationships
class CreatePlayers < ActiveRecord::Migration[7.1]
  # rubocop:disable Metrics
  def change
    create_table :players do |t|
      t.string :name, null: false, default: "Player One"
      t.unique_constraint [:name]
      t.timestamps
    end

    create_table :collections do |t|
      t.string :name, null: false, default: "My Collection"
      t.boolean :wishlist, null: false, default: false
      t.belongs_to :player
      t.timestamps
    end

    create_table :designers do |t|
      t.string :name, null: false, default: "Designer"
      t.unique_constraint [:name]
      t.string :website
      t.timestamps
    end

    create_table :games do |t|
      t.string :name, null: false, default: "Game"
      t.unique_constraint [:name]
      t.string :slug, null: false, default: "game"
      t.unique_constraint [:slug]
      t.string :emoji, null: false, default: "🎲"
      t.string :bgg_url
      t.int4range :play_count
      t.int4range :play_time
      t.references :base_game, foreign_key: { to_table: :games }
      t.belongs_to :designer
      t.timestamps
    end

    create_table :collections_games, id: false do |t|
      t.belongs_to :collection
      t.belongs_to :game
    end

    create_table :libraries, &:timestamps
  end
  # rubocop:enable Metrics
end
