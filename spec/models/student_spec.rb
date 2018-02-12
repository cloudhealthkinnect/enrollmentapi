require 'rails_helper'

RSpec.describe Student, type: :model do

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:middlename) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:password) }
  end

  describe "Associations"  do
    it { should have_many(:student_enrollments) }
    it { should have_many(:courses).through(:student_enrollments) }
  end

  describe "After Student Registration" do
    it "generates student number" do
      student = FactoryBot.create(:student)
      student.reload
      expect(student.studentnumber).to_not eq(nil)
    end
  end

end
