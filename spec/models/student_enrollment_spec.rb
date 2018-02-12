require 'rails_helper'

RSpec.describe StudentEnrollment, type: :model do
  describe "Validation" do
    it { should belong_to(:student) }
    it { should belong_to(:course) }
  end
end
