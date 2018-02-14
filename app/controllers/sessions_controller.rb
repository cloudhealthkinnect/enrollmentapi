ACCESS_TOKEN = 'access_token'.freeze
class SessionsController < ApplicationController # :nodoc:
  skip_before_action :authenticate
  def create
    command = AuthenticateUser.call(auth_params)
    if command.success?
      render json: { ACCESS_TOKEN: command.result }, status: 200
    else
      render json: command.errors, status: 401
    end
  end

  private

  def auth_params
    params.permit(:username, :password, :grant_type)
  end
end
