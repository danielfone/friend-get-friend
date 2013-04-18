FactoryGirl.define do

  factory :entry do
    name 'Test Visitor'
    sequence(:email) { |n| "test#{n}@example.com" }
  end

end
