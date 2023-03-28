
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpec.describe 'delete' do 
  describe 'can delete a star' do 
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false, created_at: "2023-03-23 20:51:00"}
    let!(:star_2) {Star.create! name: "Proxima Centauri", star_type:"red dwarf", age: 4.8, size: "2.428 to 10^29 kg", can_nova:false, created_at: "2023-03-23 20:52:00" }
    let!(:star_3) {Star.create! name: "Betelgeuse", star_type:"red supergiant", age: 0.0085, size: "2.188 to 10^31 kg", can_nova:true, created_at: "2023-03-23 20:53:00" }
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}

    it 'can delete a star via a button on the star index page' do 
      visit "/stars"

      expect(page).to have_content("Sol")
      expect(page).to have_content("Proxima Centauri")
      expect(page).to have_content("Betelgeuse")

      click_button ("Delete Betelgeuse")

      expect(current_path).to eq("/stars")

      expect(page).to_not have_content("Betelgeuse")

      click_button ("Delete Sol")

      expect(page).to_not have_content("Sol")
    end
  end
end