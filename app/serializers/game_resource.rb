# This resource serializes a board game model
class GameResource
  include Alba::Resource

  root_key :game

  attributes :id, :name

  attribute :display_name, &:display_name
  attribute :number_of_players, &:number_of_players
  attribute :game_length_in_minutes, &:game_length_in_minutes

  attribute :designer_name do |resource|
    resource.designer.name
  end

  attribute :designer_website do |resource|
    resource.designer.website
  end
end
