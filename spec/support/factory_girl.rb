require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Question #{n}" * 10 }
    description "#{Faker::Lorem.paragraph(30, false, 4)}"
    sequence(:user_id) { |n| n }
  end

  factory :short_title_question, class: Question do
    sequence(:title) { |n| "Question #{n}" }
    description "#{Faker::Lorem.paragraph(30, false, 4)}"
    sequence(:user_id) { |n| n }
  end

  factory :short_description_question, class: Question do
    sequence(:title) { |n| "Question #{n}" * 10 }
    description "Short description"
    sequence(:user_id) { |n| n }
  end

  factory :user do
    sequence(:name) { |n| "User #{n}" }
  end

  factory :answer do
    sequence(:description) { |n| "answer #{n}" * 50 }
    sequence(:user_id) { |n| n }
    sequence(:question_id) { |n| n }
  end
end
