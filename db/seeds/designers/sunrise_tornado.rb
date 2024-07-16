# Sunrise Tornado
Designer.create_with(
  website: "https://www.sunrisetornado.com"
).find_or_create_by!(
  name: "Sunrise Tornado"
)

# FORK
Game.create_with(
  slug: "fork",
  emoji: "🦊",
  bgg_url: "https://boardgamegeek.com/boardgame/370095/fork",
  play_count: 2..6,
  play_time: 20..20,
  designer: Designer.s("Sunrise Tornado")
).find_or_create_by!(
  name: "FORK"
)
