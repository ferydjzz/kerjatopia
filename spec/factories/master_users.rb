FactoryGirl.define do
  factory :master_user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    role_id { Faker::Number.number(1) }
    start_job_level { Faker::Number.number(1) }
  end
end