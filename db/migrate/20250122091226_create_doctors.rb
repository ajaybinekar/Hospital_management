class CreateDoctors < ActiveRecord::Migration[8.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.string :contact_number
      t.string :email
      t.string :nationality
      t.string :gender
      t.text :qualifications
      t.text :experience
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
