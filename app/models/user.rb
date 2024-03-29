class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  normalizes :email, with: ->(email){ email.strip.downcase }
  has_secure_password

  before_validation :check_uniqueness_errors

  private

  def check_uniqueness_errors
    if self.errors[:name].any?
      self.errors.add(:name, "has already been taken")
    end
    if self.errors[:email].any?
      self.errors.add(:email, "has already been taken")
    end
  end
end
