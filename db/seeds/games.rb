Designer.create_with(
  website: "https://unstablegames.com").find_or_create_by!(
  name: "Unstable Games"
)

Game.create_with(
  play_count: 2..4,
  play_time: 30..60,
  teaser: "Smile, it's almost over.",
  elevator_pitch: "Lately, it feels like we’re all just dinosaurs trying to avoid the falling meteors. In this game, you’ll try to dodge" \
    " all of life’s little disasters. You might fall into a pit of hot lava or get ghosted by your dino date, but the dino who survives " \
    "it all wins the game!",
  designer: Designer.s("Unstable Games")).find_or_create_by!(
  name: "Happy Little Dinosaurs"
)
