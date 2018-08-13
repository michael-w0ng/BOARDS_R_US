class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.float :price
      t.string :category
      t.string :photo
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
