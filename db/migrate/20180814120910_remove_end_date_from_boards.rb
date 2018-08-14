class RemoveEndDateFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :end_date, :date
  end
end
