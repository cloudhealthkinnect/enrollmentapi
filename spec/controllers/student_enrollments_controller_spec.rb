require 'rails_helper'

RSpec.describe StudentEnrollmentsController, type: :controller do
  include AuthHelper
  before(:each) do
    @jwt = http_login
  end

  describe "Create New StudentEnrollment" do
    it "should be successful" do
      student = FactoryBot.create(:student)
      course = FactoryBot.create(:course)
      request.env["HTTP_AUTHORIZATION"] = "Bearer #{@jwt}"
      post :create, params: { student_id: student.id, course_id: course.id }
      expect(response).to be_success
    end
  end

  describe "Delete StudentEnrollment" do

  end
end
