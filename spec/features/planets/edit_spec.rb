require 'rails_helper'

RSpec.describe '/planets/:id/edit' do
  describe 'can edit a planet' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
    
    it 'can visit the planet edit page' do
      visit "/planets/#{planet_1.id}"

      expect(page).to have_content("Earth")
    end

    it 'can edit a planet' do
      visit "/planets/#{planet_1.id}"

      click_on "Edit Earth"

      select "false", :from => "has_life"

      click_on "Update Planet"

      expect(page).to have_content("false")
    end

    
  end
end
