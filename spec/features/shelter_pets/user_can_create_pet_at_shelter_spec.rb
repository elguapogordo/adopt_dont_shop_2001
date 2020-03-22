require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the shelter pet page and create new pet" do
    shelter1 = Shelter.create(name: "Buddy Center",
                              address: "4556 Castleton Court",
                              city: "Castle Rock",
                              state: "CO",
                              zip: "80109")

    visit "shelters/#{shelter1.id}/pets"

    click_on "Create Pet"

    fill_in :name, with: "Bailey"
    fill_in :sex, with: "female"
    fill_in :age, with: 6
    fill_in :description, with: "dog"
    fill_in :image, with: "https://i.redd.it/hcprm17ktpu21.jpg"

    click_button "Create Pet"

    expect(current_path).to eq ("/shelters/#{shelter1.id}/pets")
    expect(page).to have_content("Bailey")
    expect(page).to have_css("img[src='https://i.redd.it/hcprm17ktpu21.jpg']")

  end
end
