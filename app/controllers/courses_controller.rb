class CoursesController < ApplicationController
  def index
    courses = Course.all
    course_list = []
    courses.each do |course|
      course_list.push({
        id: course.id,
        name: course.name,
        units: course.units
        })
    end
    render json: course_list
  end
end
