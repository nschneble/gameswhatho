# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# seed designers and games
Dir[Rails.root.join("db/seeds/designers/*.rb")].each do |seed|
  load seed
end

# seed players and collections
Dir[Rails.root.join("db/seeds/players/*.rb")].each do |seed|
  load seed
end

# seed a user for the admin dashboard
User.create_with(
  password: "8qLMiXtieeBRsWqQ7sp7",
  password_confirmation: "8qLMiXtieeBRsWqQ7sp7"
).find_or_create_by!(
  email: "nick.schneble@hey.com"
)
