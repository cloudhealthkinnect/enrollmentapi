class StudentEnrollmentsController < ApplicationController
  def create
    if Student.exists?(student_enrollment_params[:studentId])
      student = Student.find(student_enrollment_params[:studentId])
      if !student.courses.exists?(student_enrollment_params[:courseId])
        student_enrollment = StudentEnrollment.new(student_id: student_enrollment_params[:studentId], course_id: student_enrollment_params[:courseId])
        if student_enrollment.save
          render json: {success: {message: "Student successfully enrolled to course."}}
        else
          render json: student_enrollment.errors.messages
        end
      else
        render json: {error: {message: "Student is already enrolled in this course."}}
      end
    else
      render json: {error: {message: "Student record not found."}}
    end
  end

  def delete
    student_enrollment = StudentEnrollment.find_by_student_id_and_course_id(student_enrollment_params[:studentId], student_enrollment_params[:courseId])
    if !student_enrollment.nil?
      if student_enrollment.delete
        render json: {success: {message: "Student successfully unenrolled from course."}}
      else
        render json: student_enrollment.errors.messages
      end
    else
      render json: {error: {message: "Student is not enrolled in this course."}}
    end
  end

  private

  def student_enrollment_params
    params.permit(:studentId, :courseId)
  end

end
