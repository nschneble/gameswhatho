# IELLO Games
Designer.create_with(
  website: "https://iellogames.com"
).find_or_create_by!(
  name: "IELLO Games"
)

# King of Tokyo
Game.create_with(
  slug: "king-of-tokyo",
  emoji: "🗼",
  bgg_url: "https://boardgamegeek.com/boardgame/70323/king-of-tokyo",
  play_count: 2..6,
  play_time: 30..30,
  designer: Designer.s("IELLO Games")
).find_or_create_by!(
  name: "King of Tokyo"
)
