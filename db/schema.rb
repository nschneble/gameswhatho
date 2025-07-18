# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_04_033703) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "name", default: "My Collection", null: false
    t.boolean "wishlist", default: false, null: false
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_collections_on_player_id"
  end

  create_table "collections_games", id: false, force: :cascade do |t|
    t.bigint "collection_id"
    t.bigint "game_id"
    t.index ["collection_id"], name: "index_collections_games_on_collection_id"
    t.index ["game_id"], name: "index_collections_games_on_game_id"
  end

  create_table "designers", force: :cascade do |t|
    t.string "name", default: "Designer", null: false
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

    t.unique_constraint ["name"]
  end

  create_table "games", force: :cascade do |t|
    t.string "name", default: "Game", null: false
    t.string "slug", default: "game", null: false
    t.string "emoji", default: "🎲", null: false
    t.string "bgg_url"
    t.int4range "play_count"
    t.int4range "play_time"
    t.bigint "base_game_id"
    t.bigint "designer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_game_id"], name: "index_games_on_base_game_id"
    t.index ["designer_id"], name: "index_games_on_designer_id"
    t.unique_constraint ["name"]
    t.unique_constraint ["slug"]
  end

  create_table "libraries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name", default: "Player One", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

    t.unique_constraint ["name"]
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "games", column: "base_game_id"
end
