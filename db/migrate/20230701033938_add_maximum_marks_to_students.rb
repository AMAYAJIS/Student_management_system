class AddMaximumMarksToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :maximum_marks, :integer
  end
end
