class Star < ActiveRecord::Base 
  has_many :planets

  def self.order_by
    order(created_at: :desc)
  end

  def planets_count
    planets.count
  end

  def sort_by_name(sort)
    if sort == "alpha"
      self.planets.order(name: :asc)
    else
      self.planets
    end
  end
end