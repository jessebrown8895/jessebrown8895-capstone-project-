class CustomerSerializer < ActiveModel::Serializer
  attributes :name, :email, :password
  has_many :appointments 
  has_many :barbers, through: :appointments
end
