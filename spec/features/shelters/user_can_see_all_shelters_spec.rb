require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the shelter index page and see shelters" do
    shelter1 = Shelter.create(name: "Buddy Center",
                              address: "4556 Castleton Court",
                              city: "Castle Rock",
                              state: "CO",
                              zip: "80109")

    shelter2 = Shelter.create(name: "Harmony Equine Center",
                              address: "5540 E. Hwy. 86",
                              city: "Franktown",
                              state: "CO",
                              zip: "80116")

    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end
