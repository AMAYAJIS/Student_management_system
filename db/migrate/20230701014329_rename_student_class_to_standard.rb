class RenameStudentClassToStandard < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :student_class, :standard
  end
end
