class PurchaseOrder < ApplicationRecord
    belongs_to :user

    has_many :po_products
    has_many :products, through: :po_products
    
    validates :po, :bin, :start_date, :completion_date, presence: true
    validates :po, :bin, uniqueness: true

    private 

    def title_case_bin
        self.bin = bin.uppercase
    end

end
