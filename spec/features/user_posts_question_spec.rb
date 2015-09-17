require 'rails_helper'

feature 'user posts a question', %(
  As a user
  I want to post a question
  So that I can receive help from others

  Acceptance Criteria
  - [x] I must provide a title that is at least 40 characters long
  - [x] I must provide a description that is at least 150 characters long
  - [x] I must be presented with errors if I fill out the form incorrectly
) do

  scenario 'user submits question successfully' do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    visit new_question_path

    fill_in 'Title', with: question.title
    fill_in 'Description', with: question.description
    fill_in 'User', with: user.id
    click_button 'Create Question'

    expect(page).to have_content(/Question added/i)
    expect(page).to have_content(question.title)
  end

  scenario 'user tries to submit with invalid title' do
    user = FactoryGirl.create(:user)
    visit new_question_path

    fill_in 'Title', with: 'This should be a fail question'
    fill_in 'Description', with: 'It has nothing to do with the database' * 10
    fill_in 'User', with: user.id
    click_button 'Create Question'
    expect(page).to have_content("Title is too short (minimum is 40 characters)")
    expect(page).to have_content('New Question')
  end

  scenario 'user tries to submit with invalid description' do
    user = FactoryGirl.create(:user)
    visit new_question_path

    fill_in 'Title', with: 'This should be a fail question' * 4
    fill_in 'Description', with: 'It has nothing to do with the database'
    fill_in 'User', with: user.id
    click_button 'Create Question'

    expect(page).to have_content("Description is too short (minimum is 150 characters)")
    expect(page).to have_content('New Question')
  end
end
