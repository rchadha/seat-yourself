class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :cuisine_restaurants
  has_many :cuisines, :through => :cuisine_restaurants

  #Restaurants must have a valid name
  validates :name, :capacity, presence: true
  validates :capacity, numericality: true

  #carrierwave
  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode
end
