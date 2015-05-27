FactoryGirl.define do
  factory :comment do
    commenter Faker::Name.name
    Faker::Hacker.say_something_smart
  end
end
