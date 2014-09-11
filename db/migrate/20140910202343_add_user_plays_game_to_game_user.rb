class AddUserPlaysGameToGameUser < ActiveRecord::Migration
  def change
    add_column :game_users, :user_plays_game, :boolean
  end

  def self.up
    add_column :game_users, :user_plays_game, :boolean, :default => false
  end

  def self.down
    remove_column :game_users, :user_plays_game
  end
  
end
