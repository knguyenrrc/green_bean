class Product < ApplicationRecord
    belongs_to :Category
    # has_many :order_line_items
    # has_many :orders, through: :order_line_items
    validates :product_name, :price, presence: true
end
