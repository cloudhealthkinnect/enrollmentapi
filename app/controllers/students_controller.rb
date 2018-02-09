class StudentsController < ApplicationController

  skip_before_action :authenticate, :only => [:create]


  def index
    students = Student.all
    student_details = []
    students.each do |student|
      student_details.push({
        id: student.id,
        firstName: student.firstname,
        middleName: student.middlename,
        lastName: student.lastname,
        gender: student.gender,
        email: student.email,
        studentEnrollments: [],
        })
    end
    render json: student_details, status: 200
  end

  def show
    student = Student.find(params[:id])
    studentEnrollments = []
    enrolledCourses = StudentEnrollment.all.where(student_id: params[:id])
    if !enrolledCourses.nil?
      enrolledCourses.each do |studentEnrollment|
        studentEnrollments.push({
          id: studentEnrollment.id,
          student_id: studentEnrollment.student_id,
          course_id: studentEnrollment.course_id,
          course: {
            id: studentEnrollment.course.id,
            name: studentEnrollment.course.name,
            units: studentEnrollment.course.units
          }
        })
      end
    end
    student_details = {
      firstName: student.firstname,
      middleName: student.middlename,
      lastName: student.lastname,
      gender: student.gender,
      email: student.email,
      studentNumber: student.studentnumber,
      studentEnrollments: studentEnrollments
    }
    render json: student_details, status: 200
  end

  def create
    student = Student.new(student_params)
    if student.save
      render json: {success: {message: 'Student successfully created.'}}, status: 200
    else
      render json: {error: {message: student.errors.messages }}, status: 401
    end
  end

  def show_current_student
    student = current_student
    student_details = {
      firstName: student.firstname,
      middleName: student.middlename,
      lastName: student.lastname,
      gender: student.gender,
      email: student.email
    }
    render json: student_details, status: 200
  end

  private

  def student_params
    params.permit(:firstname, :middlename, :lastname, :gender, :password, :email)
  end

end
