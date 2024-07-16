# Funforge
Designer.create_with(
  website: "https://funforge.fr/en"
).find_or_create_by!(
  name: "Funforge"
)

# Professor Evil and The Citadel of Time
Game.create_with(
  slug: "professor-evil-and-the-citadel-of-time",
  emoji: "⏰",
  bgg_url: "https://boardgamegeek.com/boardgame/219708/professor-evil-and-the-citadel-of-time",
  play_count: 2..4,
  play_time: 30..45,
  designer: Designer.s("Funforge")
).find_or_create_by!(
  name: "Professor Evil and The Citadel of Time"
)
