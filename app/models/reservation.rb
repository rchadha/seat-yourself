class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :party_size, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :reservation_between_six_and_ten
  validate :capacity_size

  def capacity_size
  	existing_reservations = Reservation.where("restaurant_id = ? AND reserved_at > ? AND reserved_at < ?", self.restaurant_id, self.reserved_at.beginning_of_hour, self.reserved_at.end_of_hour)
		total_seats_reserved = existing_reservations.sum(:party_size)
		if party_size > (self.restaurant.capacity - total_seats_reserved)
			errors[:base] << "Capacity Exceeded"
		end
  end 

  def reservation_between_six_and_ten
  	if reserved_at.hour < 18 or reserved_at.hour > 20 
  		errors[:base] << "Reservation hours has to be between 6 PM and 10 PM"
  	end
  	
  end 

end
