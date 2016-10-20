require "rails_helper"

feature "registered user can add a goal" do
  scenario "registered user successfully adds a goal" do
    user = FactoryGirl.create(:user)
    goal = FactoryGirl.build(:goal)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit goals_path
    click_link "new career goal"
    expect(page).to have_content "new career goal"

    fill_in 'Title', with: goal.title
    fill_in 'Description', with: goal.description
    fill_in 'datepicker', with: goal.deadline

    click_button "Add Career Goal"
    expect(page).to have_content "#{goal.title}"
  end
end
