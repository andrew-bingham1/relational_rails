require 'rails_helper'
# User Story 2, Parent Show 
RSpec.describe '/stars/:id', type: :feature do
  describe 'as a visitor when I vist "/stars/:id" I see the show page' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:star_2) {Star.create! name: "Proxima Centauri", star_type:"red dwarf", age: 4.8, size: "2.428 to 10^29 kg", can_nova:false }
    let!(:star_3) {Star.create! name: "Betelgeuse", star_type:"red supergiant", age: 0.0085, size: "2.188 to 10^31 kg", can_nova:true }
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
    let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}

    it 'can display star attributes' do 
      visit "/stars/#{star_1.id}"

      expect(page).to have_content(star_1.name)
      expect(page).to have_content(star_1.star_type)
      expect(page).to have_content(star_1.age)
      expect(page).to have_content(star_1.size)
      expect(page).to have_content(star_1.can_nova)

      visit "/stars/#{star_2.id}"

      expect(page).to have_content(star_2.name)
      expect(page).to have_content(star_2.star_type)
      expect(page).to have_content(star_2.age)
      expect(page).to have_content(star_2.size)
      expect(page).to have_content(star_2.can_nova)

      visit "/stars/#{star_3.id}"

      expect(page).to have_content(star_3.name)
      expect(page).to have_content(star_3.star_type)
      expect(page).to have_content(star_3.age)
      expect(page).to have_content(star_3.size)
      expect(page).to have_content(star_3.can_nova)
    end

#User Story 7, Parent Child Count
    it 'can give a count of planets' do
      visit "/stars/#{star_1.id}"

      expect(page).to have_content("Number of Planets: #{star_1.planets.count}")
    end

#User Story 9, Parent Index Link
    it 'shows All Stars link on Stars show page' do

      visit "/stars/#{star_1.id}"

      expect(page).to have_content("All Stars")
    end

#User Story 10, Parent Child Index Link
    it 'shows the Stars planets link on the Stars show page' do

      visit "/stars/#{star_1.id}"

      expect(page).to have_content("Sol's Planets")
    end
  end
end
