require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  def setup
    @reservation = reservations(:one)
  end

  test "fixture must be valid" do
     assert @reservation.valid?
  end



end
