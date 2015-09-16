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

  scenario 'user successfully answers question' do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    visit question_path(question)

    expect(page).to have_content('New Answer')
    fill_in 'Description', with: "This is an answer description" * 20
    click_button 'Add Answer'

    expect(page).to have_content(question.title)
    expect(page).to have_content("This is an answer description")
    expect(page).to have_content("Answer added")
  end

  scenario 'user enters invalid answer' do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    visit question_path(question)

    expect(page).to have_content('New Answer')
    fill_in 'Description', with: "This is an answer description" * 20
    click_button 'Add Answer'

  end

end
