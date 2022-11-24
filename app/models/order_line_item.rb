class OrderLineItem < ApplicationRecord
  # belongs_to :Order
  # belongs_to :Product
  belongs_to :Tax
  validates :price, :quantity, :total_tax_rate, presence: true
end
