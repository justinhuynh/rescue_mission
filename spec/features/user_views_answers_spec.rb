require 'rails_helper'

feature 'user views answers to a question', %(
  As a user
  I want to view the answers for a question
  So that I can learn from the answer

  Acceptance Criteria

  - [ ] I must be on the question detail page
  - [ ] I must only see answers to the question I'm viewing
  - [ ] I must see all answers listed in order, most recent last
) do

  scenario 'user visits question details and sees answers' do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    answer = FactoryGirl.create(:answer)
    answer.question = question
    visit question_path(question)
    save_and_open_page

    expect(page).to have_content(question.description)
    save_and_open_page
    expect(page).to have_content(answer.description)
    # expect(page).to have_content("This is an answer description")
    # expect(page).to have_content("Answer added")
  end
end
