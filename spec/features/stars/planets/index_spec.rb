require 'rails_helper'
# User Story 5, Parent Children Index
RSpec.describe '/stars/:id/planets' do
  describe 'as a visitor when vist "/stars/:id/planets" I see an index of all planets related to that star' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}

    it 'can show a stars planets' do 
      visit "/stars/#{star_1.id}/planets"

      expect(page).to have_content(planet_1.name)
      expect(page).to have_content(planet_1.planet_type)
      expect(page).to have_content(planet_1.diameter)
      expect(page).to have_content(planet_1.num_moons)
      expect(page).to have_content(planet_1.has_life)

      expect(page).to have_content(planet_2.name)
      expect(page).to have_content(planet_2.planet_type)
      expect(page).to have_content(planet_2.diameter)
      expect(page).to have_content(planet_2.num_moons)
      expect(page).to have_content(planet_2.has_life)
    end

    it 'can add planets to a star via button' do 
      visit "/stars/#{star_1.id}/planets"

      click_button "Create Planet"

      expect(current_path).to eq("/stars/#{star_1.id}/planets/new")
    end
#User Story 16
    it 'can sort by name when the link is clicked' do
      visit "/stars/#{star_1.id}/planets"

      expect(planet_2.name).to appear_before(planet_1.name)

      click_on "Sort Alphabetically"

      expect(current_path).to eq("/stars/#{star_1.id}/planets")

      expect(planet_1.name).to appear_before(planet_2.name)
    end
  end
end