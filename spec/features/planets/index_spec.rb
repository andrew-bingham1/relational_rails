require 'rails_helper'
# User Story 3, Child Index [ ] done

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

RSpec.describe '/planets' do
  describe 'as a visitor when vist "/planets" I see the index page' do
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true}

    it 'can visit the planets index page' do
      visit "/planets"

      expect(page).to have_content(planet_1.name)
      expect(page).to have_content(planet_1.planet_type)
      expect(page).to have_content(planet_1.diameter)
      expect(page).to have_content(planet_1.num_moons)
      expect(page).to have_content(planet_1.has_life)
    end
    
  end