class Product < ApplicationRecord
  belongs_to :user 
  has_many :po_products
  has_many :purchase_orders, through: :po_products
  has_many :product_materials
  has_many :materials, through: :product_materials
  
  validates :name, :color, :size, :sku, :category, presence: true
  validates :name, :sku, uniqueness: true

  scope :bags, -> {where(category: "Bag")}  
end
