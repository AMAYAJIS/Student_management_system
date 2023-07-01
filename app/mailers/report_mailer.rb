class ReportMailer < ApplicationMailer
	 def send_report(csv_file_path, recipient_email)
    attachments['student_marks_report.csv'] = File.read(csv_file_path)
    mail(to: recipient_email, subject: 'Student Marks Report')
  end
end
