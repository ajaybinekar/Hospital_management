class CreateAvailabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :availabilities do |t|
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
