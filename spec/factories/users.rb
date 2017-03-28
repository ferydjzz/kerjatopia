FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    role_id { Faker::Number.number(1) }
    job_level { Faker::Number.number(1) }
  end
end