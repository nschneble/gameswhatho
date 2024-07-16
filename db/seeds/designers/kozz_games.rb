# Kozz Games
Designer.create_with(
  website: "https://www.kozz.com"
).find_or_create_by!(
  name: "Kozz Games"
)

# Dark Tomb: Bloodthorn Island
Game.create_with(
  slug: "dark-tomb-bloodthorn-island",
  emoji: "🐍",
  bgg_url: "https://boardgamegeek.com/boardgame/400949/dark-tomb-bloodthorn-island",
  play_count: 1..5,
  play_time: 15..40,
  designer: Designer.s("Kozz Games")
).find_or_create_by!(
  name: "Dark Tomb: Bloodthorn Island"
)
