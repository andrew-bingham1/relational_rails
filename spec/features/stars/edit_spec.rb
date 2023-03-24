require 'rails_helper'

RSpec.describe '/stars/:id/edit', type: :feature do
  describe 'can edit a parent' do
    let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false, created_at: "2023-03-23 20:51:00"}
  
    it 'can edit a star on the edit page' do
      visit "/stars/#{star_1.id}/edit"
      
    end
  end
end