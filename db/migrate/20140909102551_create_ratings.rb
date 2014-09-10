class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :game_user, index: true
      t.integer :score
      t.integer :user_id
      t.integer :amount,			null: false, default: 0


      t.timestamps
    end
  end
end
