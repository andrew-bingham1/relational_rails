require 'rails_helper'
# User Story 5, Parent Children Index [ ] done

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
RSpec.describe '/stars/:id/planets' do
  describe 'as a visitor when vist "/stars/:id/planets" I see an index of all planets related to that star' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf star", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
    let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}

    it 'can show a stars planets' do 
      visit "/stars/#{star_1.id}/planets"
save_and_open_page
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
  end
end