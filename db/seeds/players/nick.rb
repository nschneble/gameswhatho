# Nick Schneble
Player.find_or_create_by!(name: "Nick")

# seed Nick's collection of board games
default_collection = Player.s("Nick").collections.first
default_collection.games << Game.s("Happy Little Dinosaurs")
default_collection.games << Game.s("Sushi Go!")
default_collection.games << Game.s("Abandon All Artichokes")
