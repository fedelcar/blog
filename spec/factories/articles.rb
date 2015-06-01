FactoryGirl.define do
  factory :article do
    title Faker::Company.name
    text Faker::Company.catch_phrase
  end
end
