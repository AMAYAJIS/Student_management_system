class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.date :date_of_birth
      t.string :student_class
      t.integer :total_marks

      t.timestamps
    end
  end
end
