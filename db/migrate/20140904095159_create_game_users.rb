class CreateGameUsers < ActiveRecord::Migration
  def change
    create_table :game_users do |t|
    	t.integer :user_id
    	t.integer :game_id
    	t.integer :rating_id
    	t.integer :average,			null: false, default: 0
    	
      	t.timestamps
    end
  end
end
