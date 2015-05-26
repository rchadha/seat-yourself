class User < ActiveRecord::Base
  has_many :reservations
  has_many :restaurants
  has_secure_password

  before_save { self.email = email.downcase }

  validates :first_name,:last_name,  presence: true, {presence: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
end
