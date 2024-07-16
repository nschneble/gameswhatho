# Nick Schneble
Player.find_or_create_by!(name: "Nick")

# Nick's collection of board games
default_collection = Player.s("Nick").collections.first
default_collection.games << Game.s("Abandon All Artichokes")
default_collection.games << Game.s("Classic BANANAGRAMS")
default_collection.games << Game.s("Dark Tomb: Bloodthorn Island")
default_collection.games << Game.s("Everdell")
default_collection.games << Game.s("Everdell").exp("Spirecrest")
default_collection.games << Game.s("Forbidden Bridge")
default_collection.games << Game.s("Forbidden Island")
default_collection.games << Game.s("FORK")
default_collection.games << Game.s("Happy Little Dinosaurs")
default_collection.games << Game.s("Happy Little Dinosaurs").exp("5-6 Player Expansion Pack")
default_collection.games << Game.s("King of Tokyo")
default_collection.games << Game.s("Lost Cities")
default_collection.games << Game.s("Professor Evil and The Citadel of Time")
default_collection.games << Game.s("Sushi Go!")
default_collection.games << Game.s("Taco Cat Goat Cheese Pizza")
