require 'rails_helper'

RSpec.describe Course, type: :model do
  subject {
    Course.new(name: "Course Name", units: 1)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without units" do
      subject.units = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:student_enrollments) }
    it { should have_many(:students).through(:student_enrollments) }
  end

end
