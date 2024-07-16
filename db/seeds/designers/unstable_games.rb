# Unstable Games
unstable_games = Designer.create_with(
  website: "https://unstablegames.com"
).find_or_create_by!(
  name: "Unstable Games"
)

# Happy Little Dinosaurs
Game.create_with(
  slug: "happy-little-dinosaurs",
  emoji: "🦖",
  bgg_url: "https://boardgamegeek.com/boardgame/325414/happy-little-dinosaurs",
  play_count: 2..4,
  play_time: 30..60,
  designer: unstable_games
).find_or_create_by!(
  name: "Happy Little Dinosaurs"
)

# Happy Little Dinosaurs 5-6 Player Expansion Pack
Game.create_with(
  slug: "happy-little-dinosaurs-5-6-player-expansion-pack",
  emoji: "🦕",
  bgg_url: "https://boardgamegeek.com/boardgame/325451/happy-little-dinosaurs-5-6-player-expansion-pack",
  play_count: 2..6,
  play_time: 30..60,
  base_game: Game.s("Happy Little Dinosaurs"),
  designer: unstable_games
).find_or_create_by!(
  name: "5-6 Player Expansion Pack"
)
