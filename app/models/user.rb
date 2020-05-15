class User < ApplicationRecord
  has_secure_password
  has_many :purchase_orders, :dependent => :delete_all
end
