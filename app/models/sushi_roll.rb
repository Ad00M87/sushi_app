class SushiRoll < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :price, :roll_count, :spicy, :fish, :wrap

  def self.by_price
    order(:price)
  end

end
