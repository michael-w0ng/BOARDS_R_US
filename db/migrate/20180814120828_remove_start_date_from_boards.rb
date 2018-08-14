class RemoveStartDateFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :start_date, :date
  end
end
