class Province < ApplicationRecord
  has_many :address, dependent: :nullify
end
