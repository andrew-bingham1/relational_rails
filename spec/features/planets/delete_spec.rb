# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

require 'rails_helper'
RSpec.describe 'delete child' do 
  describe 'delete planet from show page' do 
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
    let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:true, star: star_1}

    it 'can delete a planet via a button' do
      visit "/planets" 

      expect(page).to have_content("Earth")
      expect(page).to have_content("Mars")

      visit "/planets/#{planet_1.id}"

      expect(page).to have_content("Earth")

      click_button ("Delete Earth")

      expect(current_path).to eq("/planets")

      expect(page).to_not have_content("Earth")
    end
  end
end