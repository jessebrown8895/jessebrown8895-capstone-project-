class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.datetime :purchased_at, precision: 6, null: false
      t.belongs_to :appointment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
