class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :name, presence: true,
                    length: { minimum: 2 }
 	
 	validates :description, presence: true,
                    length: { minimum: 5 }

  validates :price, presence: true,
  									numericality: { :greater_than => 0 }

  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

                      
end
