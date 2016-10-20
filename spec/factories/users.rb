require 'faker'

FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    username { Faker::Internet.user_name }
    password "password"
    password_confirmation "password"
    email { Faker::Internet.email }
  end
end
