require 'rails_helper'


RSpec.describe '/stars', type: :feature do
  describe 'as a visitor when vist "/stars" I see the index page' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false, created_at: "2023-03-23 20:51:00"}
    let!(:star_2) {Star.create! name: "Proxima Centauri", star_type:"red dwarf", age: 4.8, size: "2.428 to 10^29 kg", can_nova:false, created_at: "2023-03-23 20:52:00" }
    let!(:star_3) {Star.create! name: "Betelgeuse", star_type:"red supergiant", age: 0.0085, size: "2.188 to 10^31 kg", can_nova:true, created_at: "2023-03-23 20:53:00" }

# User Story 1, Parent Index 
    it 'can vist the index page' do 

      visit "/stars"

      expect(page).to have_content(star_1.name)
      expect(page).to have_content(star_2.name)
      expect(page).to have_content(star_3.name)
    end

    it 'can order by most recently created' do

      expect(Star.order_by.first.name).to eq("Betelgeuse")

      star_1.created_at = "2023-03-23 20:55:00"
      star_1.save

      expect(Star.order_by.first.name).to eq("Sol")
    end

# User Story 8, Child Index Link
    it 'shows All Planets link on Stars index page' do

      visit "/stars"

      expect(page).to have_content("All Planets")
    end

    it 'has a link on the Star index page to create a new Star' do
      visit "/stars"

      click_on "Create New Star"

      expect(current_path).to eq("/stars/new")
    end
  end
end