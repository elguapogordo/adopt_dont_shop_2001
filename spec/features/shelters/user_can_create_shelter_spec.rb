require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the shelter new page and create a new shelter" do
    shelter1 = Shelter.create(name: "Buddy Center",
                              address: "4556 Castleton Court",
                              city: "Castle Rock",
                              state: "CO",
                              zip: "80109")

    visit "/shelters/"

    expect(page).to have_link(shelter1.name)
    expect(page).to have_link 'New Shelter', href: '/shelters/new'

    click_link "New Shelter"

    expect(current_path).to eq ("/shelters/new")
    expect(page).to have_field :name
    expect(page).to have_field :address
    expect(page).to have_field :city
    expect(page).to have_field :state
    expect(page).to have_field :zip
    expect(page).to have_button "Create Shelter"

    fill_in :name, with: "Shiny Shelter"
    fill_in :address, with: "321 Countdown Timer"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80231"

    click_button "Create Shelter"

    expect(current_path).to eq ("/shelters")
    expect(page).to have_link(shelter1.name)
    expect(page).to have_link("Shiny Shelter")
    expect(page).to have_link 'New Shelter', href: '/shelters/new'
  end
end
