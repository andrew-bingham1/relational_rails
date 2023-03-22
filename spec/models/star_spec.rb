require "rails_helper"

describe Star, type: :model do
   describe "validations" do
      it {should have_many(:planets)}
   end
end