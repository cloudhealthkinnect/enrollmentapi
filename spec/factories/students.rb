require 'faker'

FactoryBot.define do
  factory :student do |f|
    f.firstname { Faker::Name.first_name }
    f.middlename { Faker::Name.last_name }
    f.lastname { Faker::Name.last_name }
    f.gender { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.password { Faker::Name.first_name }
  end
end
