class OrderItem < ActiveRecord::Base
  belongs_to :order
  validates :product_id, presence: true
  
  validates :price, presence: true
  									
  validates :quantity, presence: true,
                    numericality: { only_integer: true, :greater_than => 0 }
end
