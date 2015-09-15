require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Question #{n}" * 10 }
    description "#{Faker::Lorem.paragraph(30, false, 4)}"
    sequence(:user_id) { |n| "#{n}" }
  end
end
