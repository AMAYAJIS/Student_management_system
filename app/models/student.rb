require 'csv'
class Student < ApplicationRecord
  has_one_attached :photo
	validates :name, :date_of_birth, :class, :total_marks, presence: true 
	scope :sorted, -> { order(date_of_birth: :desc,  standard: :asc, total_marks: :asc) }
	 scope :search, ->(name, date_of_birth, standard, total_marks) {
  students = all

  students = students.where('name LIKE ?', "%#{name}%") if name.present?
  students = students.where(date_of_birth: date_of_birth) if date_of_birth.present?
  students = students.where(standard: standard) if standard.present?
  students = students.where(total_marks: total_marks) if total_marks.present?

  students
}
def self.generate_csv_report(selected_class)
    students = Student.where(standard: selected_class)

    CSV.generate(headers: true) do |csv|
      csv << ['Name', 'Date of Birth', 'Class', 'Total Marks', 'Maximum Marks']

      students.each do |student|
        csv << [student.name, student.date_of_birth, student.standard, student.total_marks, student.maximum_marks]
      end
    end
  end
end
