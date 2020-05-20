class PoProduct < ApplicationRecord
  belongs_to :purchase_order, optional: true
  belongs_to :product, optional: true
  validates :quantity, presence: true

  scope :most_recent, -> {PoProduct.order("created_at DESC").limit(5)}
  # scope :order_by_quantity, -> {order(:quantity)}
end
