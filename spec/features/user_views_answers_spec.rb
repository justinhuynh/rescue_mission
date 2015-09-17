require 'rails_helper'

feature 'user views answers to a question', %(
  As a user
  I want to view the answers for a question
  So that I can learn from the answer

  Acceptance Criteria

  - [x] I must be on the question detail page
  - [x] I must only see answers to the question I'm viewing
  - [x] I must see all answers listed in order, most recent last
) do

  scenario 'user visits question details and sees answers, listed in order with most recent last' do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    answer_1 = FactoryGirl.create(:answer)
    answer_2 = FactoryGirl.create(:answer)
    answer_1.question = question
    answer_2.question = question
    question.answers << answer_1
    question.answers << answer_2
    visit question_path(question)

    expect(page).to have_content(question.description)
    expect(page.body).to have_content(/#{answer_2.description}.*#{answer_1.description}/im)
  end

  scenario 'user sees answers only associated with current question' do
    question_1 = FactoryGirl.create(:question)
    question_2 = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    answer_1 = FactoryGirl.create(:answer)
    answer_2 = FactoryGirl.create(:answer)

    answer_1.question = question_1
    question_1.answers << answer_1

    answer_2.question = question_2
    question_2.answers << answer_2

    visit question_path(question_2)

    expect(page).to have_content(question_2.title)
    expect(page).to have_content(answer_2.description)

    expect(page).to_not have_content(question_1.title)
    expect(page).to_not have_content(answer_1.description)
  end
end
