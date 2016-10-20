FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    sequence(:username) { |n| "john_doe#{n}" }
    password "password"
    password_confirmation "password"
    sequence(:email) { |n| "john_doe#{n}@gmail.com" }
  end
end
