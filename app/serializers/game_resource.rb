# This resource serializes a board game model
class GameResource
  include Alba::Resource

  root_key :game

  attributes :id, :name, :play_count, :play_time, :teaser, :elevator_pitch

  attribute :number_of_players, &:number_of_players
  attribute :game_length_in_minutes, &:game_length_in_minutes

  attribute :designer_name do |resource|
    resource.designer.name
  end

  attribute :designer_website do |resource|
    resource.designer.website
  end
end
