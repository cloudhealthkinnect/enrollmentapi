class StudentEnrollmentSerializer < ActiveModel::Serializer # :nodoc:
  attributes :id, :student_id, :course_id, :course
end
