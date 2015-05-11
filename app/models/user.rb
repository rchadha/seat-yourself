class User < ActiveRecord::Base
  has_many :reservations
  has_many :restaurants

  validates :first_name,:last_name, :email, presence: true
end
