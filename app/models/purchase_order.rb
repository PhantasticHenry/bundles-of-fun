class PurchaseOrder < ApplicationRecord
    belongs_to :user
    has_many :po_products, :dependent => :delete_all
    has_many :products, through: :po_products, :dependent => :delete_all

end
