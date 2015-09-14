require 'rails_helper'

feature 'user views all questions', %(
  As a user
  I want to view recently posted questions
  So that I can help others

  Acceptance Criteria
  - [x] I must see the title of each question
  - [x] I must see questions listed in order, most recently posted first
) do

  scenario 'see all questions' do
    question_1 = Question.create(
      title: "hellohellohellohellohellohellohellohellohello",
      description: "something something something something something something something something something something something something something something something something something ",
      user_id: '2'
    )

    question_2 = Question.create(
      title: "goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye ",
      description: "something something something something something something something something something something something something something something something something something ",
      user_id: '3'
    )
    visit root_path
    expect(page).to have_content(question_2.title)
    expect(page).to have_content(question_1.title)
    expect(page.body).to have_content(/#{question_2.title}.*#{question_1.title}/im)
  end
end
