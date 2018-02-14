class StudentsController < ApplicationController # :nodoc:
  skip_before_action :authenticate, only: :create

  def index
    render json: Student.all, status: 200
  end

  def show
    student = Student.find_by_id(params[:id])
    render json: Student.find(params[:id]), status: 200 if student
    render status: 422 unless student
  end

  def create
    student = Student.new(student_params)
    if student.save
      render json: { success: { message: 'Student successfully created.' } }, status: 200
    else
      render json: { error: { message: student.errors.messages } }, status: 422
    end
  end

  def show_current_student
    render json: current_student, status: 200
  end

  private

  def student_params
    params.permit(:first_name, :middle_name, :last_name, :gender, :password, :email)
  end
end
