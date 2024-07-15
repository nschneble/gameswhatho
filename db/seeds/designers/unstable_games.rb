# Unstable Games
Designer.create_with(
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
  designer: Designer.s("Unstable Games")
).find_or_create_by!(
  name: "Happy Little Dinosaurs"
)
