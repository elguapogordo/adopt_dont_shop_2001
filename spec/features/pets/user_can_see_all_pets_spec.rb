require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit the pets index page and see pets" do
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

    pet1 = Pet.create(name: "Pet One",
                      sex: "male",
                      age: 1,
                      description: "dog",
                      image: "https://i.redd.it/hcprm17ktpu21.jpg",
                      shelter: shelter1)

    pet2 = Pet.create(name: "Pet Two",
                      sex: "female",
                      age: 2,
                      description: "cat",
                      image: "https://compote.slate.com/images/5d0784dc-0c12-4a8b-a97b-3e3c856d7186.jpg",
                      shelter: shelter2)

    visit "/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.description)
    expect(page).to have_css("img[src='https://i.redd.it/hcprm17ktpu21.jpg']")
    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_content(pet2.age)
    expect(page).to have_content(pet2.description)
    expect(page).to have_css("img[src='https://compote.slate.com/images/5d0784dc-0c12-4a8b-a97b-3e3c856d7186.jpg']")
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)

  end
end
