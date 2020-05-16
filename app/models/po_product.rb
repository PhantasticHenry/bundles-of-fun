class PoProduct < ApplicationRecord
  belongs_to :purchase_order, optional: true
  belongs_to :product, optional: true
end
