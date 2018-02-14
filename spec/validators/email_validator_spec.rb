require 'rails_helper'

# Basic test object
module Test
  EmailValidatable = Struct.new(:email) do
    include ActiveModel::Validations

    validates :email, email: true
  end
end

# Validator tests with the test object
describe EmailValidator, type: :model do
  subject { Test::EmailValidatable.new 'test@mail.de' }

  it { is_expected.to be_valid }

  context 'without @' do
    it 'is invalid' do
      subject.email = 'mail.de'
      subject.valid?
      expect(subject.errors[:email]).to match_array('This is not a valid email address.')
    end
  end

  # More tests
end
