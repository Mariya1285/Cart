class SelectedProduct < ActiveRecord::Base

	belongs_to :product
	
	validates :product_id, presence: true

  validates :price, presence: true

	validates :quantity, presence: true,
                    numericality: { only_integer: true }



end
