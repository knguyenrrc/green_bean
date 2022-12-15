class Product < ApplicationRecord
  belongs_to :Category
  has_many :order_line_items, dependent: :nullify
  has_many :orders, through: :order_line_items
  validates :product_name, :price, presence: true
  accepts_nested_attributes_for :order_line_items, allow_destroy: true
  has_one_attached :image
end
