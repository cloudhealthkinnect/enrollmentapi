class StudentSerializer < ActiveModel::Serializer # :nodoc:
  has_many :student_enrollments
  attributes :id, :first_name, :middle_name, :last_name, :gender, :email, :student_number
end
