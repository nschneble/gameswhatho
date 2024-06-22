%w[Nick].each do |name|
  Player.find_or_create_by!(name:)
end
