require 'rails-helper'
# User Story 1, Parent Index [ ] done

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe '/stars' do
  describe 'as a visitor when vist "/stars" I see the index page' do
    let!(:star_1) {Star.create! name: "Sol" type: "G-type"}

  end
end