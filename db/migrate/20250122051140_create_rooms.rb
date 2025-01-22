class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.references :department, null: false, foreign_key: true
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
