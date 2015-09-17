require 'rails_helper'

feature 'user edits a question', %(
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates

  Acceptance Criteria
  - [x] I must provide valid information
  - [x] I must be presented with errors if I fill out the form incorrectly
  - [x] I must be able to get to the edit page from the question details page
) do

  scenario 'user edits question successfully' do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    new_description = "Updated this question! #{question.description}"
    visit edit_question_path(question)

    fill_in 'Title', with: question.title
    fill_in 'Description', with: new_description
    fill_in 'User', with: user.id
    click_button 'Update Question'

    expect(page).to have_content(/Question updated/i)
    expect(page).to have_content(new_description)
  end

  scenario 'user tries to edit with invalid title' do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    visit edit_question_path(question)

    fill_in 'Title', with: 'This should be a fail question'
    fill_in 'Description', with: question.description
    fill_in 'User', with: user.id
    click_button 'Update Question'

    expect(page).to have_content('Editing Question')
    expect(page).to have_content("Title is too short (minimum is 40 characters)")
  end

  scenario 'user tries to edit with invalid description' do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    visit edit_question_path(question)

    fill_in 'Title', with: question.title
    fill_in 'Description', with: 'Super short description'
    fill_in 'User', with: user.id
    click_button 'Update Question'

    expect(page).to have_content('Editing Question')
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
  end
end
