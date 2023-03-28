require 'rails_helper'

RSpec.describe '/planets' do
  describe 'as a visitor when vist "/planets" I see the index page' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
    let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}

    # User Story 3, Child Index
    it 'can visit the planets index page' do
      visit "/planets"

      expect(page).to have_content(planet_1.name)
      expect(page).to have_content(planet_1.planet_type)
      expect(page).to have_content(planet_1.diameter)
      expect(page).to have_content(planet_1.num_moons)
      expect(page).to have_content(planet_1.has_life)

      expect(page).to_not have_content(planet_2.name)
      
    
      ###previous test where index showed all 
      # expect(page).to have_content(planet_2.name)
      # expect(page).to have_content(planet_2.planet_type)
      # expect(page).to have_content(planet_2.diameter)
      # expect(page).to have_content(planet_2.num_moons)
      # expect(page).to have_content(planet_2.has_life)
    end

#User Story 18
    it 'can update a planet from the planet index page' do
      visit "/planets"

      click_on "Edit Earth"

      fill_in 'name', with: "Venus"
      select "true", :from => "has_life"

      click_on "Update Planet"

      expect(current_path).to eq("/planets/#{planet_1.id}")
    end

 #User Story 23
    it 'can delete planets via planets index' do
      visit '/planets' 

      expect(page).to have_content(planet_1.name)

      click_button("Delete Earth")

      expect(page).to_not have_content(planet_1.name)
    end
  end
end