class Order < ApplicationRecord
    has_many :order_line_items
    has_many :products, through: :order_line_items
    validates :total_amount, presence: true
    accepts_nested_attributes_for :order_line_items, allow_destroy: true
end
