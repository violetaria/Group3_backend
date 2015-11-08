class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :user_id, null: false
      t.integer :deck_id, null: false

      t.timestamps null: false
    end
  end
end
