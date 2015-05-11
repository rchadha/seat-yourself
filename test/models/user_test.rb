require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #will run before each
  def setup
    @user = users(:one)
  end

  test "the fixture should be valid" do
    assert @user.valid?
  end

  test "must have first name" do
    @user.first_name = nil
    assert_not @user.valid?
  end

  test "must have last name" do
    @user.last_name = nil
    assert_not @user.valid?
  end

  test "must have email address" do
    @user.email = nil
    assert_not @user.valid?
  end
end
