require 'rails_helper'

feature 'user views question detail', %(
  As a user
  I want to view a question's details
  So that I can effectively understand the question

  Acceptance Criteria
  - [ ] I must be able to get to this page from the questions index
  - [ ] I must see the question's title
  - [ ] I must see the question's description
) do

  scenario 'view question details' do
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
    click_link(question_1.title)
    expect(page).to have_content(question_1.title)
    expect(page).to have_content(question_1.description)
  end
end
