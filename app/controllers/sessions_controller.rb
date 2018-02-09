class SessionsController < ApplicationController

  skip_before_action :authenticate

  def create
    student = Student.find_by_email(auth_params[:username])
    if student
      if student.authenticate(auth_params[:password]) && check_grant_type
        jwt = Auth.issue({student_id: student.id})
        render json: {access_token: jwt}
      else
        render json: student.errors.message
      end
    else
      invalid_username_password
    end

  end

  private

  def auth_params
    params.permit(:username, :password, :grant_type)
  end

  def invalid_username_password
    render json: {error: {message: 'Invalid username or password.'}}
  end

  def check_grant_type
    if auth_params[:grant_type] == 'password'
      true
    else
      false
    end
  end
end
