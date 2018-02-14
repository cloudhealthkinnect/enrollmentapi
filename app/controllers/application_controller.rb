class ApplicationController < ActionController::Base # :nodoc:
  protect_from_forgery with: :null_session
  before_action :authenticate

  def logged_in?
    return true if current_student
    false
  end

  def current_student
    return unless auth_present?
    student = Student.find(auth['student_id'])
    return unless student
    @current_student ||= student
  end

  def authenticate
    render json: { error: 'unauthorized' }, status: 401 unless logged_in?
  end

  private

  def token
    request.env['HTTP_AUTHORIZATION'].scan(/Bearer (.*)$/).flatten.last
  end

  def auth
    Auth.decode(token)
  end

  def auth_present?
    return true if request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer/).flatten.first
    false
  end
end
