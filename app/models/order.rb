class Order < ActiveRecord::Base
	has_many :order_items, dependent: :destroy
	validates :user_id, presence: true
	validates :total_cost, presence: true,
                    numericality: { :greater_than => 0 }
                    
end
