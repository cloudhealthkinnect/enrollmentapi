require 'faker'
FactoryBot.define do
  factory :course do |f|
    f.name { Faker::Name.first_name }
    f.units { Faker::Number.number(2) }
  end
end
