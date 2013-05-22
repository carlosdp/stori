FactoryGirl.define do
  factory :author do
    first_name "Luke"
    sequence(:last_name){|n| "Skywalker#{n}" }
    phone "555-555-5555"
    password "testpass"
    password_confirmation "testpass"
    active true
  end

  factory :story do
    author
    title 'The Book'
  end
end
