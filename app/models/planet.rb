class Planet < ApplicationRecord
  belongs_to :star 

  def self.show_life
    Planet.where(has_life: "true").to_a
  end
end