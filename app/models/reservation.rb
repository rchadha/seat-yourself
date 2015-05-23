class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :party_size, presence: true
  validate :reservation_between_six_and_ten
  #validate :capacity_size

  def reservation_between_six_and_ten
  	if reserved_at.hour < 18 or reserved_at.hour > 20 
  		errors[:base] << "Reservation hours has to be between 6 PM and 10 PM"
  	end
  	
  end 

end
