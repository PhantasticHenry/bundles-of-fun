class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :purchase_order, optional: true
end
