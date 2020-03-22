require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the pet show page and see details" do
    shelter1 = Shelter.create(name: "Buddy Center",
                              address: "4556 Castleton Court",
                              city: "Castle Rock",
                              state: "CO",
                              zip: "80109")
    pet1 = Pet.create(name: "Pet One",
                      sex: "male",
                      age: 1,
                      description: "dog",
                      image: "https://i.redd.it/hcprm17ktpu21.jpg",
                      shelter: shelter1,
                      adoptable: "adoptable")

    visit "/pets/#{pet1.id}"

    click_on "Update Pet"

    expect(current_path).to eq ("/pets/#{pet1.id}/edit")

    fill_in :name, with: "Bailey"
    fill_in :sex, with: "female"
    fill_in :age, with: 6
    fill_in :description, with: "dog"
    fill_in :image, with: "https://i.redd.it/hcprm17ktpu21.jpg"
    click_on "Update Pet"

    expect(current_path).to eq ("/pets/#{pet1.id}")
    expect(page).to have_content("Bailey")
    expect(page).to have_no_content("Pet One")
  end
end
