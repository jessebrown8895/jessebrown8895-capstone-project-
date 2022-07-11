class Customer < ApplicationRecord
    has_many :appointments 
    has_many :barbers, through: :appointments
    has_secure_password

    validates :name, presence: true, length: {in: 3..15}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, length: {in: 5..20}
end
