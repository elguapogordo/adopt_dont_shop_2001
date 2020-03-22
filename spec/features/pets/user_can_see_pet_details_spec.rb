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

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.description)
    expect(page).to have_content(pet1.adoptable)
    expect(page).to have_css("img[src='https://i.redd.it/hcprm17ktpu21.jpg']")

  end
end
