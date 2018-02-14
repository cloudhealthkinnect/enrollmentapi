require 'bcrypt'

class Student < ApplicationRecord # :nodoc:
  include BCrypt

  validates :first_name, :middle_name, :last_name, :gender, :email, presence: true
  validates :email, uniqueness: true, email: true

  has_secure_password

  has_many :student_enrollments
  has_many :courses, through: :student_enrollments

  after_create :generate_student_number

  def generate_student_number
    update(student_number: Date.today.year.to_s + '-' + Student.count.to_s)
  end
end
