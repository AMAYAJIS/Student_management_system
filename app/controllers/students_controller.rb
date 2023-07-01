require 'csv'
class StudentsController < ApplicationController
  def index
    if params[:name].present?
    redirect_to students_search_path(name: params[:name])
  else
    @students = Student.sorted
  end
  end

	def new
    # @student = Student.new
  end
  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
   if @student.save
    flash[:notice] = "Student details got created."
      redirect_to student_path(@student)
   else
      render :new
   end
  end

  def edit
   @student = Student.find(params[:id])
  end

def update
  @student = Student.find(params[:id]) 
  if @student.update(student_params)
    puts "Student updated successfully"
    redirect_to student_path(@student)
  else
    render :edit
  end
end
def destroy
  @student = Student.find(params[:id])
  @student.destroy
   redirect_to student_path
end
def search
  @search_name = params[:name]
  @search_date_of_birth = params[:date_of_birth]
  @search_class = params[:standard]
  @search_total_marks = params[:total_marks]
  
  @students = Student.search(@search_name, @search_date_of_birth, @search_class, @search_total_marks)
end

  def generate_report
    selected_class = params[:selected_class]
    csv_data = Student.generate_csv_report(selected_class)

    csv_file_path = Rails.root.join('tmp', 'student_marks_report.csv')
    File.write(csv_file_path, csv_data)

    flash[:notice] = "CSV report generated successfully."
    send_file csv_file_path, filename: 'student_marks_report.csv', type: 'text/csv'
    recipient_email = 'amayashaji2021@gmail.com' # Replace with the desired recipient's email address

  ReportMailer.send_report(csv_file_path, recipient_email).deliver_now

  flash[:notice] = "CSV report generated and sent successfully."
  redirect_to students_path


  end

  private
   def student_params
    params.require(:student).permit(:name, :date_of_birth, :standard, :total_marks, :maximum_marks, :photo, :father_name, :mother_name, :blood_group, :resident_address)
  end
end
