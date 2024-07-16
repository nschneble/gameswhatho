# Hasbro Gaming
Designer.create_with(
  website: "http://hasbrogaming.com"
).find_or_create_by!(
  name: "Hasbro Gaming"
)

# Forbidden Bridge
Game.create_with(
  slug: "forbidden-bridge",
  emoji: "🗿",
  bgg_url: "https://boardgamegeek.com/boardgame/3945/forbidden-bridge",
  play_count: 2..4,
  play_time: 10..10,
  designer: Designer.s("Hasbro Gaming")
).find_or_create_by!(
  name: "Forbidden Bridge"
)
