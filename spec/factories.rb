FactoryGirl.define do
  factory :author do
    first_name "Luke"
    sequence(:last_name){|n| "Skywalker#{n}" }
    phone "555-555-5555"
    active true
  end
end
