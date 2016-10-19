FactoryGirl.define do
  factory :user do
    first_name "Big"
    last_name "Papi"
    sequence(:username) { |n| "big_papi#{n}" }
    password "redsox"
    password_confirmation "redsox"
    sequence(:email) { |n| "big.papi#{n}@gmail.com" }
  end
end
