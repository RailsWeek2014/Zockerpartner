class AddDeletedToGameUser < ActiveRecord::Migration
  def change
    add_column :game_users, :deleted, :boolean, :default => false
  end
end
