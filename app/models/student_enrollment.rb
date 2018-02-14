class StudentEnrollment < ApplicationRecord # :nodoc:
  belongs_to :student
  belongs_to :course
end
