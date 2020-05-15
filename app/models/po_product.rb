class PoProduct < ApplicationRecord
  belongs_to :purcahse_order
  belongs_to :product
end
