require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the shelter show page and delete shelter" do
    shelter1 = Shelter.create(name: "Buddy Center",
                              address: "4556 Castleton Court",
                              city: "Castle Rock",
                              state: "CO",
                              zip: "80109")
    shelter2 = Shelter.create(name: "Shiny Shelter",
                              address: "321 Countdown Court",
                              city: "Denver",
                              state: "CO",
                              zip: "80231")

    visit "/shelters/#{shelter1.id}"

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to have_content("Shiny Shelter")
    expect(page).to_not have_content("Buddy Center")

  end
end
