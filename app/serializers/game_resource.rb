# This resource serializes a board game model
class GameResource
  include Alba::Resource

  root_key :game

  attributes :id, :name, :emoji

  attribute :display_name, &:display_name
  attribute :number_of_players, &:number_of_players
  attribute :game_length_in_minutes, &:game_length_in_minutes

  attribute :base_game do |resource|
    if resource.expansion?
      resource.base_game.name
    else
      nil
    end
  end

  attribute :expansions do |resource|
    if resource.expansions?
      resource.expansions.order(:name).map(&:name).join(", ")
    else
      nil
    end
  end

  attribute :designer_name do |resource|
    resource.designer.name
  end

  attribute :designer_website do |resource|
    resource.designer.website
  end
end
