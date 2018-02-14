require 'rails_helper'
RSpec.describe StudentEnrollmentsController, type: :controller do
  let(:student) do
    create(:student)
  end
  let(:course) do
    create(:course)
  end
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_student).and_return(student)
  end
  subject(:create_student_enrollment) do
    post :create, params: { student_id: student.id, course_id: course.id }
  end
  describe 'POST #create' do
    subject(:create_context) do
      post :create, params: { student_id: student.id, course_id: course.id }
    end
    it 'should enroll the student' do
      create_context
      expect(response).to have_http_status(200)
    end
    it 'should fail if the student does not exist' do
      post :create, params: { student_id: nil, course_id: course.id }
      expect(response).to_not be_success
    end
    it 'should fail if the student is already enrolled' do
      create_student_enrollment
      create_context
      expect(response).to_not be_success
    end
  end
  describe 'POST #delete' do
    subject(:delete_context) do
      post :delete, params: { student_id: student.id, course_id: course.id }
    end
    it 'should unenroll the student' do
      create_student_enrollment
      delete_context
      expect(response).to be_success
    end
    it 'should fail if the student is not enrolled' do
      delete_context
      expect(response).to have_http_status(422)
    end
  end
end
