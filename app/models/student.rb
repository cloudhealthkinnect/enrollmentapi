require 'bcrypt'
require_dependency 'app/validators/email_validator.rb'

class Student < ApplicationRecord

  include BCrypt

  validates :firstname, :middlename, :lastname, :gender, :email, presence: { message: "This is required."}
  validates :email, uniqueness: { message: "E-mail is already in use."}, email: true

  has_secure_password

  has_many :student_enrollments
  has_many :courses, through: :student_enrollments

  after_create :generate_student_number

  def generate_student_number
    self.update(studentnumber: DateTime.now.year.to_s + "-" + Student.count.to_s)
  end

end
