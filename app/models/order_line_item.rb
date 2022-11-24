class OrderLineItem < ApplicationRecord
  belongs_to :Order
  belongs_to :Product
  belongs_to :Tax
end
