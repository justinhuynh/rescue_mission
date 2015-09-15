require 'rails_helper'

feature 'user answers a question', %(
  As a user
  I want to answer another user's question
  So that I can help them solve their problem

  Acceptance Criteria
  - [ ] I must be on the question detail page
  - [ ] I must provide a description that is at least 50 characters long
  - [ ] I must be presented with errors if I fill out the form incorrectly
) do

  question = FactoryGirl.create(:question)
  user = FactoryGirl.create(:user)

  scenario 'user successfully answers question' do
    visit question_path(question)

    expect(page).to have_content('New Answer')
    fill_in 'Description', with:
    click_button 'Add Answer'

    # expect(page).to have_content(/Question added/i)
    # expect(page).to have_content(question.title)
  end

  scenario 'user enters invalid answer' do

  end

end
