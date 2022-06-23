class Purchase < ApplicationRecord
    has_many :product_purchases
    has_many :products, through: :product_purchases
    belongs_to :appointment
end
