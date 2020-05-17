class Material < ApplicationRecord
    belongs_to :user
    validates :name, :color, :size, :sku, :category, presence: true
    validates :name, :sku, uniqueness: true
end
