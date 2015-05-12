class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :party_size, presence: true
  #validate :capacity_size
end
