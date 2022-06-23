class CreateBarbers < ActiveRecord::Migration[6.1]
  def change
    create_table :barbers do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.string "password_digest"
      t.timestamps
    end
  end
end
