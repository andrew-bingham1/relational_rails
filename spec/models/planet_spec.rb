require "rails_helper"

describe Planet, type: :model do
   describe "relationships" do
      it {should belong_to(:star)}
   end

   describe 'it can only show planets where theres life' do
      let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false}
      let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}
      let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}
      
      it 'show only only life' do 
         expect(Planet.show_life).to eq([planet_1])

         planet_2.has_life = true
         planet_2.save

         expect(Planet.show_life).to eq([planet_1,planet_2])
      end
      

   
   end
end