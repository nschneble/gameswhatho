json.extract! game, :id, :name, :play_count, :play_time, :teaser, :elevator_pitch, :created_at, :updated_at
json.url game_url(game, format: :json)
