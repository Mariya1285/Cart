class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  validates :age, presence: true,
  								numericality: { :greater_than => 0 }

  validates :mobile, presence: true,
                    length: { :minimum => 10, :maximum => 10 }

  validates :address, presence: true,
                    length: {  minimum: 5 }

  validates :country, presence: true

  validates :postal_code, presence: true
                
end
