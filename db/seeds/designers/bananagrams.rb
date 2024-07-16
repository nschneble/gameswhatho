# Bananagrams
Designer.create_with(
  website: "https://bananagrams.com"
).find_or_create_by!(
  name: "Bananagrams"
)

# Classic BANANAGRAMS
Game.create_with(
  slug: "classic-bananagrams",
  emoji: "🍌",
  bgg_url: "https://boardgamegeek.com/boardgame/27225/bananagrams",
  play_count: 1..8,
  play_time: 30..30,
  designer: Designer.s("Bananagrams")
).find_or_create_by!(
  name: "Classic BANANAGRAMS"
)
