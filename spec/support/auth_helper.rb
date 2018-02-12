module AuthHelper
  def http_login
    student = FactoryBot.create(:student)
    Auth.issue({student_id: student.id})
  end
end
