require "rails_helper"
#test not functioning
feature "registered user can add a goal" do
  scenario "registered user successfully adds a goal" do
    user = FactoryGirl.create(:user)
    goal = FactoryGirl.build(:goal)

    user_signs_in(user)

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
