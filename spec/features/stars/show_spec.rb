require 'rails_helper'
# User Story 2, Parent Show [ ] done

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

RSpec.describe 'stars show page' do
  describe 'as a visitor when I vist "/stars/:id" I see the show page' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf star", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
    let!(:star_2) {Star.create! name: "Proxima Centauri", star_type:"red dwarf star", age: 4.8, size: "2.428 to 10^29 kg", can_nova:false }
    let!(:star_3) {Star.create! name: "Betelgeuse", star_type:"red supergiant", age: 0.0085, size: "2.188 to 10^31 kg", can_nova:true }

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
  end
end
