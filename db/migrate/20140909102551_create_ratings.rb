class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :game_user, index: true
      t.integer :score,				null: false, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
