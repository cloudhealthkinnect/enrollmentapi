class EnrollStudent # :nodoc:
  prepend SimpleCommand

  def initialize(student_enrollment_params)
    @student_id = student_enrollment_params[:student_id]
    @course_id = student_enrollment_params[:course_id]
  end

  def call
    @student = Student.find_by_id(@student_id)
    return enroll_student if @student
    errors.add(:message, 'Student does not exist.') unless @student
  end

  private

  def check_if_user_is_enrolled_in_course
    if @student.courses.exists?(@course_id)
      errors.add(:message, "Already enrolled in #{Course.find(@course_id).name}.")
      return true
    end
    return false unless @student.courses.exists?(@course_id)
  end

  def enroll_student
    return if check_if_user_is_enrolled_in_course
    student_enrollment = StudentEnrollment.new(student_id: @student_id, course_id: @course_id)
    errors.add(:message, "Failed to enroll #{Course.find(@course_id).name}.") unless student_enrollment.save
  end
end
