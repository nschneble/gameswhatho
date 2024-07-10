# Dolphin Hat Games
Designer.create_with(
  website: "https://dolphinhat.com"
).find_or_create_by!(
  name: "Dolphin Hat Games"
)

# Taco Cat Goat Cheese Pizza
Game.create_with(
  emoji: "🌮",
  play_count: 3..8,
  play_time: 10..,
  designer: Designer.s("Dolphin Hat Games")
).find_or_create_by!(
  name: "Taco Cat Goat Cheese Pizza"
)
