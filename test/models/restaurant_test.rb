require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  #will run before each
  def setup
    @restaurant = restaurants(:one)
  end
  #will run after each test
  def teardown

  end

  test "the fixture should be valid" do
    assert @restaurant.valid?
  end

  test "must have a valid name" do
    @restaurant.name = nil
    assert_not @restaurant.valid?
  end

  test "must have a capacity" do
    @restaurant.capacity = nil
    assert_not @restaurant.valid?

  end
  test "capacity must be a number" do
    @restaurant.capacity = "one"
    assert_not @restaurant.valid?
  end
end
