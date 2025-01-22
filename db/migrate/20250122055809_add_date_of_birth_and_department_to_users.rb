class AddDateOfBirthAndDepartmentToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :blood_group, :string
    add_reference :users, :department, foreign_key: true
  end
end
