require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  include AuthHelper
  before(:each) do
    @jwt = http_login
  end

  describe "Get All Courses" do
      it "should render a json object of all available courses" do
        request.env["HTTP_AUTHORIZATION"] = "Bearer #{@jwt}"
        get :index
        expect(response.response_code).to eql(200)
      end
  end

end
