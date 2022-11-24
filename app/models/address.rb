class Address < ApplicationRecord
  belongs_to :Customer
  validates :address, :city, :postal_code, presence: true
end
