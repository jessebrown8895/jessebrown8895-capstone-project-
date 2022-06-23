class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time, precision: 6, null: false
      t.belongs_to :customer, null: true, foreign_key: false
      t.belongs_to :barber, null: false, foreign_key: true
     

      t.timestamps
    end
  end
end
