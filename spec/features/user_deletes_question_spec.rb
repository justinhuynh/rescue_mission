require 'rails_helper'

feature 'user deletes a question', %(
  As a user
  I want to delete a question
  So that I can delete duplicate questions

  Acceptance Criteria
  - [ ] I must be able delete a question from the question edit page
  - [ ] I must be able delete a question from the question details page
  - [ ] All answers associated with the question must also be deleted
) do

  scenario 'user successfully deletes question from the edit page', js: true do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    visit edit_question_path(question)

    page.accept_confirm { click_link 'Delete' }

    expect {
      visit question_path(question).to raise_error(ActionController::RoutingError)
    }
    expect(page).to have_content("Questions")
  end

  scenario 'user successfully deletes question from the details page', js: true do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    visit question_path(question)

    page.accept_confirm { click_link 'Delete' }

    expect {
      visit question_path(question).to raise_error(ActionController::RoutingError)
    }
    expect(page).to have_content("Questions")
  end

  scenario 'nothing is deleted if the user does not confirm deletion', js: true do
    question = FactoryGirl.create(:question)
    user = FactoryGirl.create(:user)
    visit question_path(question)

    page.dismiss_confirm { click_link 'Delete' }

    expect(page).to have_content(question.title)
  end
end
