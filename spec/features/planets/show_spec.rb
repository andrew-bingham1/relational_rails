require 'rails_helper'

RSpec.describe '/planets/:id' do
  describe 'as a visitor when vist "/planets/:id" I see the show page' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
    let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}

# User Story 4, Child Show
    it 'can display an individual planets page' do 
      visit "/planets/#{planet_1.id}"

      expect(page).to have_content(planet_1.name)
      expect(page).to have_content(planet_1.planet_type)
      expect(page).to have_content(planet_1.diameter)
      expect(page).to have_content(planet_1.num_moons)
      expect(page).to have_content(planet_1.has_life)
    end

#User Story 20
    it 'can delete a planet via button' do 
      visit "/planets/#{planet_1.id}"

      expect(page).to have_content(planet_1.name)

      click_button("Delete Earth")

      expect(current_path).to eq('/planets')
      expect(page).to_not have_content('Earth')
    end
  end
end