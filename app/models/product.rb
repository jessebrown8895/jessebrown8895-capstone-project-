class Product < ApplicationRecord
    has_many :product_purchases
    has_many :purchases, through: :product_purchases 
    
end
