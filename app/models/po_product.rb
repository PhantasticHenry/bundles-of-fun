class PoProduct < ApplicationRecord
  belongs_to :purcahse_order, optional: true
  belongs_to :product, optional: true
end
