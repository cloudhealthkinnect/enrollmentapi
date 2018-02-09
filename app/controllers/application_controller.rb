class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate

  def logged_in?
    !!current_student
  end

  def current_student
    if auth_present?
      student = Student.find(auth["student_id"])
      if student
        @current_student ||= student
      end
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

 private
   def token
     request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
   end

   def auth
     Auth.decode(token)
   end

   def auth_present?
     !!request.env.fetch("HTTP_AUTHORIZATION",
       "").scan(/Bearer/).flatten.first
   end
end
