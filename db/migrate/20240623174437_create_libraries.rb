# This migration creates the game library table
class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries, &:timestamps
  end
end
