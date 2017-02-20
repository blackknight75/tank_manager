require 'rails_helper'

describe 'when a user visits the tank feature new page' do
  scenario 'they fill in the form with the proper information and a feature for that tank is created' do
    user = User.create!(first_name: "Bob", last_name: "Vila", username: "thisoldhouse@gmail.com", password: "password")
    tank = user.tanks.create(name: "Super Reef", dimensions: "2x2x2", gallons: 20)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_tank_tank_feature_path(tank)
    fill_in 'tank_feature[name]', with: "Java Moss"
    fill_in 'tank_feature[cost]', with: 1.25
    fill_in 'tank_feature[description]', with: "Very resilient moss. Easy to care for."
    click_on 'Add Feature to Tank'

    expect(page).to have_current_path user_tank_path(user, tank)
    expect(page).to have_content("Java Moss")
    expect(page).to have_content("$1.25")
    expect(page).to have_content("Very relilient moss. Easy to care for.")

  end
end
