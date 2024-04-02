class Product < ApplicationRecord
  has_one_attached :image
  validates :name, presence:true
  validates :price, presence:true
  validates :description, presence:true
  has_many :cart_items
  has_many :carts, through: :cart_items
end
