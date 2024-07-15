# Gamewright
gamewright = Designer.create_with(
  website: "https://gamewright.com"
).find_or_create_by!(
  name: "Gamewright"
)

# Sushi Go!
Game.create_with(
  slug: "sushi-go",
  emoji: "🍣",
  bgg_url: "https://boardgamegeek.com/boardgame/133473/sushi-go",
  play_count: 2..5,
  play_time: 15..15,
  designer: gamewright
).find_or_create_by!(
  name: "Sushi Go!"
)

# Abandon All Artichokes
Game.create_with(
  slug: "abandon-all-artichokes",
  emoji: "🥬",
  bgg_url: "https://boardgamegeek.com/boardgame/302260/abandon-all-artichokes",
  play_count: 2..4,
  play_time: 20..20,
  designer: gamewright
).find_or_create_by!(
  name: "Abandon All Artichokes"
)
