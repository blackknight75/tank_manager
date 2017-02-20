require 'rails_helper'

describe 'when a user visits any page' do
  scenario 'they click logout in nave bar and session is ended' do

    user = User.create!(first_name: "Bob", last_name: "Vila", username: "thebeard", email: "thisoldhouse@gmail.com", password: "password")

    visit root_path
    expect(current_path).to eq(login_path)
    fill_in "Username", with: "thebeard"
    fill_in "Password", with: "password"
    click_on "Log In"

    click_on "Logout"

    expect(current_path).to eq '/login'
  end
end
