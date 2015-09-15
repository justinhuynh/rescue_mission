require 'rails_helper'

feature 'user views all questions', %(
  As a user
  I want to view recently posted questions
  So that I can help others

  Acceptance Criteria
  - [x] I must see the title of each question
  - [x] I must see questions listed in order, most recently posted first
) do

  scenario 'user sees all questions' do
    question_1 = FactoryGirl.create(:question)
    question_2 = FactoryGirl.create(:question)
    visit root_path
    expect(page).to have_content(question_2.title)
    expect(page).to have_content(question_1.title)
  end

  scenario 'user sees newest question first' do
    question_1 = FactoryGirl.create(:question)
    question_2 = FactoryGirl.create(:question)
    visit root_path
    expect(page.body).to have_content(/#{question_2.title}.*#{question_1.title}/im)
  end
end
