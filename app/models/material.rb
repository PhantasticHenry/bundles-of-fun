class Material < ApplicationRecord
    validates :name, :color, :size, :sku, :category, presence: true
    validates :name, :sku, uniqueness: true
end
