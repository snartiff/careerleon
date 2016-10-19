FactoryGirl.define do
  factory :goal do
    title "Get a job as a junior developer."
    description "I plan to graduate from Launch Academy and find a job within a month of graduating as a developer."
    deadline "12/1/16"
    user
  end
end
