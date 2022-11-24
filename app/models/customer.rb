class Customer < ApplicationRecord
  belongs_to :Order
  validates :customer_name, :phone, :email, presence: true
end
