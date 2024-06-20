class AddSetlistToBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :setlist, :text
  end
end
