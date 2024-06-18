class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.integer :user_id, null: false
      t.datetime :date_and_time, null: false
      t.string :artist, null: false
      t.string :venue, null: false
      t.string :name, null: false
      t.text :image

      t.timestamps
    end

    add_index :boards, :user_id
  end
end