require 'rails_helper'
RSpec.describe StudentsController, type: :controller do
  let(:student) do
    create(:student)
  end
  let(:course) do
    create(:course)
  end
  let(:student_enrollment) do
    StudentEnrollment.create(student.id, course.id)
  end
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_student).and_return(student)
  end
  describe 'GET #index' do
    it 'should be successful' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET #show' do
    it 'should be successful' do
      get :show, params: { id: student.id }
      expect(response).to have_http_status(200)
    end
    it 'should fail if student does not exist' do
      get :show, params: { id: 2 }
      expect(response).to have_http_status(422)
    end
  end
  describe 'POST #create' do
    it 'should be successful' do
      post :create, params: {
        first_name: 'John',
        middle_name: 'Doe',
        last_name: 'Deer',
        gender: 'male',
        email: 'john@john.com',
        password: 'password'
      }
      expect(response).to have_http_status(200)
    end
    it 'should fail if email already exists' do
      post :create, params: {
        first_name: 'John',
        middle_name: 'Doe',
        last_name: 'Deer',
        gender: 'male',
        email: student.email,
        password: 'password'
      }
      expect(response).to have_http_status(422)
    end
  end
  describe 'GET show_current_student' do
    it "should display the current user's information" do
      get :show_current_student
      resp = JSON.parse(response.body)
      current_student_id = Student.find_by_email(resp['email']).id
      expect(current_student_id).to eq(student.id)
    end
  end
end
