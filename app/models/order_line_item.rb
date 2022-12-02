class OrderLineItem < ApplicationRecord
  belongs_to :Order
  belongs_to :Product
  validates :price, :quantity, :total_tax_rate, presence: true

end
