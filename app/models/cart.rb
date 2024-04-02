class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  belongs_to :user

  def sub_total
    sum =0
    self.line_items.each do |line_items|
      sum+= line_items.total_price
    end
    sum
  end

  def sum_quantity
    self.line_items.sum(:quantity)
  end
end
