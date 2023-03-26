require 'rails_helper'

RSpec.describe '/stars/:id/planets/new' do
  describe 'as a visitor when vist "/stars/:id/planets/new" I see the form to create new planets' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
    let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}

    it 'can show a stars planets' do 
      visit "/stars/#{star_1.id}/planets/new"

      expect(page).to have_content("Planet Name")
      expect(page).to have_content("Planet Type")
      expect(page).to have_content("Planets Diameter(in miles)")
      expect(page).to have_content("Number of Moons")
      expect(page).to have_content("Does It Have Life")

    end
  end
end