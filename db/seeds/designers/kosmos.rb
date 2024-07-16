# KOSMOS
Designer.create_with(
  website: "https://www.kosmos.de"
).find_or_create_by!(
  name: "KOSMOS"
)

# Lost Cities
Game.create_with(
  slug: "lost-cities",
  emoji: "🗺",
  bgg_url: "https://boardgamegeek.com/boardgame/50/lost-cities",
  play_count: 2..2,
  play_time: 30..30,
  designer: Designer.s("KOSMOS")
).find_or_create_by!(
  name: "Lost Cities"
)
