require 'rails_helper'

feature 'registered user visits their account' do
  scenario 'clicks on My Account link after log-in' do
    user = FactoryGirl.create(:user)

    visit root_path
    user_signs_in(user)
    click_link 'My Account'

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
  end
end
