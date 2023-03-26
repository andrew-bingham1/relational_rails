require 'rails_helper'

RSpec.describe '/stars/:id/edit', type: :feature do
  describe 'can edit a star' do
    let!(:star_1) {Star.create! name: "Solar", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false, created_at: "2023-03-23 20:51:00"}
  
    it 'links to edit page' do
      visit '/stars'

      click_button "Edit #{star_1.name}"

      expect(current_path).to eq("/stars/#{star_1.id}/edit")
    end

    it 'can edit a stars name' do
      visit "/stars"

      expect(page).to have_content("Solar")

      click_button "Edit Solar"

      fill_in 'name', with: "Sol"
      check('Yes')
      click_button('Update Star')

      expect(current_path).to eq("/stars/#{star_1.id}")
      expect(page).to have_content("Sol")
    end
  end
end