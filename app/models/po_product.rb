class PoProduct < ApplicationRecord
  belongs_to :purchase_order, optional: true
  belongs_to :product, optional: true
  validates :quantity, presence: true

  # scope :order_by_quantity, -> {order(:quantity)}
end
