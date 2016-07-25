class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :name, presence: true,
                    length: { minimum: 2 }
 	
 	validates :description, presence: true,
                    length: { minimum: 5 }

  validates :price, presence: true,
  									numericality: { :greater_than => 0 }

  validates :img, presence:true

                      
end
