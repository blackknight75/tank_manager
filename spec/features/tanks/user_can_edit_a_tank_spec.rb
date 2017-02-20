require 'rails_helper'

  describe 'When a user visits a fish edit page' do
    scenario 'they can edit its attributes' do

      user = User.create!(first_name: "Bob", last_name: "Vila", username: "thisoldhouse@gmail.com", password: "password")
      tank = user.tanks.create(name: "Super Reef", dimensions: "2x2x2", gallons: 20)
      fish = tank.fish.create(name: 'Herman', breed: "Cichlid", tank_id: tank, purchase_store: "PetSmart", purchase_date: "01/01/2017", cost: 2.99)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_tank_fish_path(tank, fish)
      expect(find_field('Name').value).to eq 'Herman'
      fill_in "fish[name]", with: "Sally"
      click_on "Save"

      expect(page).to have_current_path(tank_fish_path(tank, fish))
      
      expect(page).to have_content("Sally")

    end
  end
