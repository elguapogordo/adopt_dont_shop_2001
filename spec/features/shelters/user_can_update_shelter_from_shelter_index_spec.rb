require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the shelter index page and update shelter" do
    shelter1 = Shelter.create(name: "Buddy Center",
                              address: "4556 Castleton Court",
                              city: "Castle Rock",
                              state: "CO",
                              zip: "80109")

    visit "/shelters/"

    click_link "Edit Shelter"

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

    fill_in :name, with: "Shiny Shelter"
    fill_in :address, with: "321 Countdown Timer"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80231"

    click_button "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter1.id}")
    expect(page).to have_content("Shiny Shelter")
    expect(page).to_not have_content("Buddy Center")
    shelter1.reload
    expect(shelter1.name).to eq("Shiny Shelter")

  end
end
