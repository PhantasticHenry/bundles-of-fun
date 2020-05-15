class Product < ApplicationRecord
  has_many :po_products, :dependent => :delete_all
  has_many :purchase_orders, through: :po_products, :dependent => :delete_all
end
