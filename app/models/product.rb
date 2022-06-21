class Product < ApplicationRecord
    has_many :purchases, through: :product_purchases 
    
end
