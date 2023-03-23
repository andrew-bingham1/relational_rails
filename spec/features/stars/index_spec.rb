require 'rails_helper'
# User Story 1, Parent Index [ ] done

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe '/stars', type: :feature do
  describe 'as a visitor when vist "/stars" I see the index page' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf star", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:star_2) {Star.create! name: "Proxima Centauri", star_type:"red dwarf star", age: 4.8, size: "2.428 to 10^29 kg", can_nova:false }
    let!(:star_3) {Star.create! name: "Betelgeuse", star_type:"red supergiant", age: 0.0085, size: "2.188 to 10^31 kg", can_nova:true }

    it 'can vist the index page' do 

      visit "/stars"

      expect(page).to have_content(star_1.name)
      expect(page).to have_content(star_2.name)
      expect(page).to have_content(star_3.name)
    end
  
  end
end