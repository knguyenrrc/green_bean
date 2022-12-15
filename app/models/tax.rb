class Tax < ApplicationRecord
  has_many :order_line_items, dependent: :nullify
  validates :pst, :gst, :hst, :total_tax_rate, presence: true
end
