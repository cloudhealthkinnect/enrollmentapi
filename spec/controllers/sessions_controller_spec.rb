require 'rails_helper'
RSpec.describe SessionsController, type: :controller do
  let(:student) do
    create(:student)
  end
  describe 'POST #create' do
    it 'should be successful' do
      post :create, params: { username: student.email, password: student.password, grant_type: 'password' }
      expect(response).to be_success
    end
    it 'should not be successful if wrong grant_type' do
      post :create, params: { username: student.email, password: student.password, grant_type: 'pass' }
      expect(response).to_not be_success
    end
    it 'should not be successful if wrong password' do
      post :create, params: { username: student.email, password: 'student.password', grant_type: 'password' }
      expect(response).to_not be_success
    end
    it 'should not be successful if email does not exist' do
      post :create, params: { username: 'student.email', password: student.password, grant_type: 'password' }
      expect(response).to_not be_success
    end
  end
end
