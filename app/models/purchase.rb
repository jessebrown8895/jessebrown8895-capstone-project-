class Purchase < ApplicationRecord
    has_many :products, through: :product_purchases
    belongs_to :appointments
end
