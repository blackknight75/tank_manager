require 'rails_helper'

describe 'when a user visits new breed page' do
  scenario 'they fill in a form, submit and new breed is created' do
    user = User.create!(first_name: "Bob", last_name: "Vila", username: "thisoldhouse@gmail.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_breed_path

    fill_in 'breed[name]', with: "Goldfish"
    fill_in 'breed[temperament]', with: "Community"
    click_on "Create Breed"

    expect(current_path).to eq breed_path(Breed.last)
    expect(page).to have_content("Goldfish")
    expect(page).to have_content("Community")
  end

  scenario 'user can create a new breed' do
  user = User.create!(first_name: "Bob", last_name: "Vila", username: "thisoldhouse@gmail.com", password: "password")
  tank = user.tanks.create(name: "Super Reef", dimensions: "2x2x2", gallons: 20)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit new_tank_fish_path(tank)
  click_on "Add New Breed"

  fill_in 'breed[name]', with: "Cichlid"
  fill_in 'breed[temperament]', with: "Aggressive"
  click_on "Create Breed"

  expect(current_path).to eq breed_path(Breed.last)
  expect(page).to have_content("Cichlid")
  expect(page).to have_content("Aggresive")
  end
end
