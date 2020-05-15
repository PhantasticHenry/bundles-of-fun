class User < ApplicationRecord
  has_secure_password
  has_many :purchase_orders

  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true

end
