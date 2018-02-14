require 'faker'
FactoryBot.define do
  factory :student do |f|
    f.first_name { Faker::Name.first_name }
    f.middle_name { Faker::Name.last_name }
    f.last_name { Faker::Name.last_name }
    f.gender { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.password { Faker::Name.first_name }
  end
end
