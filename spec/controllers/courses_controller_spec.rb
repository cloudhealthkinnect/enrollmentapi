require 'rails_helper'
RSpec.describe CoursesController, type: :controller do
  before do
    create(:course)
  end
  let(:student) do
    create(:student)
  end
  describe 'GET #index' do
    it 'should be successful' do
      allow_any_instance_of(ApplicationController).to receive(:current_student).and_return(student)
      get :index
      expect(response).to be_success
    end
  end
end
