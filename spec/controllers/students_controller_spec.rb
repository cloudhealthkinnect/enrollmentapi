require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  context "Logged In" do
    include AuthHelper
    before(:each) do
      @jwt = http_login
    end
    describe "Get All Students" do
      it "should be successful" do
        request.env["HTTP_AUTHORIZATION"] = "Bearer #{@jwt}"
        get :index
        expect(response.response_code).to eql(200)
      end
      it "renders a json object for :index" do
        get :index
        parsed_body = JSON.parse(response.body.to_json)
        expect(parsed_body["id"]).should_not == nil
      end
    end

    describe "Show Student" do
      it "renders a json object for the student" do
        get :show, params: { id: 1 }
        parsed_body = JSON.parse(response.body.to_json)
        expect(parsed_body["email"]).should_not == nil
      end
    end

    describe "Show Current Student" do
      it "renders a json object of the current user's info" do
        get :show, params: { id: 1 }
        parsed_body = JSON.parse(response.body.to_json)
        expect(parsed_body["id"]).should_not == nil
      end
    end
  end

  context "Not Logged In" do
    describe "Get All Students" do
      it "should not be successful" do
        get :index
        expect(response.response_code).to eql(401)
      end
    end

    describe "Show Student" do
      it "should not be successful" do
        get :show, params: { id: 1 }
        expect(response.response_code).to eql(401)
      end
    end

    describe "Show Current Student" do
      it "renders a json object of the current user's info" do
        get :show, params: { id: 1 }
        expect(response.response_code).to eql(401)
      end
    end

    describe "Register Student" do
      context "with valid attributes" do
        it "saves the new student into the database" do
          expect{FactoryBot.create(:student)}.to change{ Student.count }.by(1)
        end
      end

      context "with invalid attributes" do
        it "does not save the student in to the database" do
          expect { Student.create(email: nil) }.to_not change{ Student.count }
        end
      end
    end
  end
end
