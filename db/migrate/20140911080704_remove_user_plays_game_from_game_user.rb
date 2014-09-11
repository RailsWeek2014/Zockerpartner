class RemoveUserPlaysGameFromGameUser < ActiveRecord::Migration
  def change
    remove_column :game_users, :user_plays_game, :boolean
  end
end
