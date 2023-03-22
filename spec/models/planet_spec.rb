require "rails_helper"

describe Planet, type: :model do
   describe "relationships" do
      it {should belong_to(:star)}
   end
end