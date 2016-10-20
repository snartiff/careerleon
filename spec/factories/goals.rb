FactoryGirl.define do
  factory :goal do
    title "Get a job as a web developer."
    description "I want to transition careers from teaching to web development."
    deadline "11/1/16"
    user
  end
end
