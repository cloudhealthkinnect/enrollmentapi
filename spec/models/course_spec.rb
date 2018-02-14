require 'rails_helper'
RSpec.describe Course, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:units) }
  end
  describe 'Associations' do
    it { should have_many(:student_enrollments) }
    it { should have_many(:students).through(:student_enrollments) }
  end
end
