class Order < ApplicationRecord
  has_many :order_line_items, dependent: :nullify
  has_many :products, through: :order_line_items
  belongs_to :Tax
  validates :total_amount, presence: true
  accepts_nested_attributes_for :order_line_items, allow_destroy: true
end
