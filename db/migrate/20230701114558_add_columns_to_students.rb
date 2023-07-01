class AddColumnsToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :father_name, :string
    add_column :students, :mother_name, :string
    add_column :students, :blood_group, :string
    add_column :students, :resident_address, :string
  end
end
