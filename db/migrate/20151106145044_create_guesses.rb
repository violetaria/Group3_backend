class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :card_id, null: false
      t.integer :user_id, null: false
      t.integer :duration, null: false
      t.boolean :correct, null: false

      t.timestamps null: false
    end
  end
end
