require "rails_helper"

describe Star, type: :model do
   describe "validations" do
      it {should have_many(:planets)}
   end

   describe 'methods' do
      let!(:star_1) {Star.create! name: "Sol", star_type: "yellow dwarf", age: 4.6, size: "1.9885 to 10^30 kg", can_nova: false, created_at: "2023-03-23 20:51:00"}
      let!(:star_2) {Star.create! name: "Proxima Centauri", star_type:"red dwarf", age: 4.8, size: "2.428 to 10^29 kg", can_nova:false, created_at: "2023-03-23 20:52:00"}
      let!(:star_3) {Star.create! name: "Betelgeuse", star_type:"red supergiant", age: 0.0085, size: "2.188 to 10^31 kg", can_nova:true, created_at: "2023-03-23 20:53:00"}
      let!(:planet_2) {Planet.create! name:"Mars", planet_type:"rocky", diameter:4212, num_moons:2, has_life:false, star: star_1}
      let!(:planet_1) {Planet.create! name:"Earth", planet_type:"rocky", diameter:7917, num_moons:1, has_life:true, star: star_1}

      it 'can order by most recently created' do
         expect(Star.order_by.first.name).to eq("Betelgeuse")

         star_1.created_at = "2023-03-23 20:55:00"
         star_1.save

         expect(Star.order_by.first.name).to eq("Sol")
      end

      it 'can count the planets' do
         expect(star_1.planets_count).to eq(2)

         planet_1.destroy

         expect(star_1.planets_count).to eq(1)
      end

      it 'can sort by name' do
         expect(star_1.order_by_name).to eq([planet_1,planet_2])
      end

      it 'give only planets above a threshold ' do 
         expect(star_1.num_moons_above(1)).to eq([planet_2])
      end

   end
end