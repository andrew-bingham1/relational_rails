require 'rails_helper'

RSpec.describe '/stars/new', type: :feature do
  describe 'can create a new parent' do
    it 'can display the new star form' do
      visit '/stars/new'

     
      expect(page).to have_content("Star Name")
      expect(page).to have_content("Star Type")
      expect(page).to have_content("Star Age (in billons)")
      expect(page).to have_content("Mass")
      expect(page).to have_content("Can it supernova?")
    end
  end
end