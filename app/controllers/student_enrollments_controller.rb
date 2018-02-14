class StudentEnrollmentsController < ApplicationController # :nodoc:
  def create
    command = EnrollStudent.call(student_enrollment_params)
    if command.success?
      render json: { message: 'Enroll successful.' }, status: 200
    else
      render json: command.errors, status: 422
    end
  end

  def delete
    command = UnenrollStudent.call(student_enrollment_params)
    if command.success?
      render json: { message: 'Unenroll successful.' }, status: 200
    else
      render json: command.errors, status: 422
    end
  end

  private

  def student_enrollment_params
    params.permit(:student_id, :course_id)
  end
end
