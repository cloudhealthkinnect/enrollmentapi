class UnenrollStudent # :nodoc:
  prepend SimpleCommand

  def initialize(student_enrollment_params)
    @student_id = student_enrollment_params[:student_id]
    @course_id = student_enrollment_params[:course_id]
  end

  def call
    @student = Student.find_by_id(@student_id)
    return unenroll_student if @student
    errors.add(:message, 'Student does not exist.') unless @student
  end

  private

  def check_if_user_is_enrolled_in_course
    is_enrolled = @student.courses.exists?(@course_id)
    return true if is_enrolled
    errors.add(:message, "Not enrolled in #{Course.find(@course_id).name}.") unless is_enrolled
    return false unless @student.courses.exists?(@course_id)
  end

  def unenroll_student
    return unless check_if_user_is_enrolled_in_course
    student_enrollment = StudentEnrollment.find_by_student_id_and_course_id(@student_id, @course_id)
    errors.add(:message, 'Failed to unenroll.') unless student_enrollment.delete
  end
end
