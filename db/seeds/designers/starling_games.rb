# Starling Games
starling_games = Designer.create_with(
  website: "https://www.starling.games"
).find_or_create_by!(
  name: "Starling Games"
)

# Everdell
Game.create_with(
  play_count: 1..4,
  play_time: 40..80,
  designer: starling_games
).find_or_create_by!(
  name: "Everdell"
)

# Everdell Spirecrest
Game.create_with(
  play_count: 1..4,
  play_time: 40..100,
  designer: starling_games
).find_or_create_by!(
  name: "Everdell Spirecrest"
)
