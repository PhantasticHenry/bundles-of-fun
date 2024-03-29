class User < ApplicationRecord
  has_secure_password
  has_many :purchase_orders
  has_many :products
  has_many :materials

  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true

end
