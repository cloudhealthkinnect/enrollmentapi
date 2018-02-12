require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "With valid parameters" do

    student = FactoryBot.create(:student)

    it "should be successful" do
      subject
      post :create, params: { username: student.email, password: student.password, grant_type: "password" }
      expect(response).to be_success
    end
  end

  describe "With invalid parameters" do
    it "should not be successful" do
      post :create, params: { username: "test@tst.com", password: "pass", grant_type: "pssword" }
      expect(response).to_not be_success
    end
  end
end
