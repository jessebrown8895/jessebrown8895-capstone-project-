class CreateAuthenticateBarbers < ActiveRecord::Migration[6.1]
  def change
    create_table :authenticate_barbers do |t|

      t.timestamps
    end
  end
end
