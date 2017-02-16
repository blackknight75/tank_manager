require 'rails_helper'

describe 'when a user visits the new fish page' do
  xscenario 'when a user fills in a form and clicks create fish' do

    visit new_fish_path

    fill_in "fish[name]"
    fill_in "fish[name]"
    fill_in "fish[name]"
    fill_in "fish[name]"
  end
end
