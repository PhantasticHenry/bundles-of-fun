class Product < ApplicationRecord
  belongs_to :user 
  has_many :po_products
  has_many :purchase_orders, through: :po_products
  validates :name, :color, :size, :sku, :category, presence: true
  validates :name, :sku, uniqueness: true
end
