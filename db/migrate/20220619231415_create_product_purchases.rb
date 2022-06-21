class CreateProductPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :product_purchases do |t|
      t.belongs_to :purchase, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :cost

      t.timestamps
    end
  end
end
