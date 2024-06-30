# Nick Schneble
Player.find_or_create_by!(name: "Nick")

# seed Nick's collection of board games
Player.s("Nick").collections.first.games << Game.s("Happy Little Dinosaurs")
