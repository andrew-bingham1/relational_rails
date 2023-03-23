class Star < ActiveRecord::Base 
  has_many :planets

  def self.order_by
    order(created_at: :desc)
  end
end