class AuthenticateUser # :nodoc:
  prepend SimpleCommand

  def initialize(auth_params)
    @username = auth_params[:username]
    @password = auth_params[:password]
    @grant_type = auth_params[:grant_type]
  end

  def call
    @student = Student.find_by_email(@username)
    return invalid_username_password unless @student
    check_password
  end

  private

  def invalid_username_password
    errors.add(:authentication, 'Incorrect username and/or password.')
  end

  def check_password
    invalid_username_password unless @student.authenticate(@password) && check_grant_type
    Auth.issue(student_id: @student.id)
  end

  def check_grant_type
    return true if @grant_type == 'password'
    false
  end
end
