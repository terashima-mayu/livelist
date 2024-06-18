class AddTimesToBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :doors_open_time, :datetime
    add_column :boards, :show_start_time, :datetime
  end
end
