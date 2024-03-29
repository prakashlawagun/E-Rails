class User < ApplicationRecord
  validates :name, presence:true
  validates :email, presence:true
  validates :password, presence:true, length: {minimum: 6}
  validates_confirmation_of :password
  normalizes :email, with: ->(email){email.strip.downcase}
  has_secure_password
end
