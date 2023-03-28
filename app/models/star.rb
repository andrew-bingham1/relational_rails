class Star < ActiveRecord::Base 
  has_many :planets

  def self.order_by
    order(created_at: :desc)
  end

  def planets_count
    planets.count
  end

  def num_moons_above(num)
    planets.where("num_moons > ?", num)
  end

  def order_by_name
      planets.order(name: :asc).to_a
  end

 
end