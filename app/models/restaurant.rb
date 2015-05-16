class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_and_belongs_to_many :cuisines
  #Restaurants must have a valid name
  validates :name, :capacity, presence: true
  validates :capacity, numericality: true
end
