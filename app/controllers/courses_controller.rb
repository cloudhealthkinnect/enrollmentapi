class CoursesController < ApplicationController # :nodoc:
  def index
    render json: Course.all, status: 200
  end
end
