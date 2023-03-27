require 'rails_helper'

RSpec.describe '/stars/:id/planets/new' do
  describe 'as a visitor when visit "/stars/:id/planets/new" I see the form to create new planets' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
    let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}

    it 'can show a new planet page' do 
      visit "/stars/#{star_1.id}/planets/new"

      expect(page).to have_content("Planet Name")
      expect(page).to have_content("Planet Type")
      expect(page).to have_content("Planet's Diameter(in miles)")
      expect(page).to have_content("Number of Moons")
      expect(page).to have_content("Does It Have Life")

    end

    it 'can fill in planet details' do
      visit "/stars/#{star_1.id}/planets/new"

      fill_in 'name', with: "Venus"
      fill_in 'planet_type', with: "Rocky"
      fill_in 'diameter', with: "7,521"
      fill_in 'num_moons', with: "0"
      select "false", :from => "has_life"
      click_on "Create Planet"

      expect(current_path).to eq("/stars/#{star_1.id}/planets")
      expect(page).to have_content("Venus")
    end
  end
end