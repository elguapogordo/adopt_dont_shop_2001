require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the pet show page and delete pet" do
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
    pet2 = Pet.create(name: "Pet Two",
                      sex: "female",
                      age: 2,
                      description: "cat",
                      image: "https://compote.slate.com/images/5d0784dc-0c12-4a8b-a97b-3e3c856d7186.jpg",
                      shelter: shelter1,
                      adoptable: "adoptable")

    visit "/pets/#{pet1.id}"

    click_on "Delete Pet"

    expect(current_path).to eq("/pets")

    expect(page).to have_content(pet2.name)
    expect(page).to have_no_content(pet1.name)
  end
end
