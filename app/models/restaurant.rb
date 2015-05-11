class Restaurant < ActiveRecord::Base
  has_many :reservations

  #Restaurants must have a valid name
  validates :name, :capacity, presence: true
  validates :capacity, numericality: true
end
