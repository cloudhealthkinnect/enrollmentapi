class Course < ApplicationRecord # :nodoc:
  validates :name, :units, presence: true
  has_many :student_enrollments
  has_many :students, through: :student_enrollments
end
