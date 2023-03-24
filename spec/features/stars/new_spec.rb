require 'rails_helper'

RSpec.describe '/stars/new', type: :feature do
  describe 'can create a new parent' do
    it 'can display the new star form' do
      visit '/stars/new'

      expect(page).to have_content("Lets create a new star:")
      expect(page).to have_content("Star Name:")
      expect(page).to have_content("Star Type:")
      expect(page).to have_content("Star Age (in billons):")
      expect(page).to have_content("Star Mass:")
      expect(page).to have_content("Can it supernova?:")
    end
  end
end