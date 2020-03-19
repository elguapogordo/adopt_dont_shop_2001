require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  xit "can visit the pets index page and see pets types names and ages" do
    pet1 = Pet.create(name: "Pet1name",
                         type: "dog",
                         age: 2)
    song_2 = Song.create(name: "Pet2name",
                         type: "cat",
                         age: 3)

    visit "/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end
