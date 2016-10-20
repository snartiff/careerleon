require "rails_helper"

feature "registered user can add a step to goal" do
  scenario "registered user successfully adds a step" do
    user = FactoryGirl.create(:user)
    goal = FactoryGirl.create(:goal)
    step = FactoryGirl.build(:step)

    visit root_path
    user_signs_in(user)

    visit goals_path
    click_link "new career goal"
    fill_in 'Title', with: goal.title
    fill_in 'Description', with: goal.description
    fill_in 'datepicker', with: goal.deadline

    click_button "Add Career Goal"
    expect(page).to have_content "#{goal.title}"

    first(:link, "#{goal.title}").click
    expect(page).to have_content "STEPS"
    click_link "Create steps for goal"

    expect(page).to have_content "CREATE A NEW STEP"
    fill_in 'Description', with: step.description
    fill_in 'datepicker', with: step.deadline
    click_button "Submit"



  end
end
