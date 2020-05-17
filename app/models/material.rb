class Material < ApplicationRecord
    
    belongs_to :user

    has_many :product_materials
    has_many :products, through: :product_materials

    validates :name, :color, :size, :sku, :category, presence: true
    validates :name, :sku, uniqueness: true

end
