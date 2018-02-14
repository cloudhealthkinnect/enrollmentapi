require 'rails_helper'
RSpec.describe Student, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:middle_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:password) }
  end
  describe 'Associations' do
    it { should have_many(:student_enrollments) }
    it { should have_many(:courses).through(:student_enrollments) }
  end
  describe 'After Student Registration' do
    it 'generates student number' do
      student = FactoryBot.create(:student)
      student.reload
      expect(student.student_number).to_not eq(nil)
    end
  end
end
