class PoProductsController < ApplicationController
       
    def index 
        @po_product = PoProduct.all
    end

    def new
        if params[:purchase_order_id] && purchase_order = PurchaseOrder.find_by(id: params[:purchase_order_id])
            @po_product = purchase_order.products.build
        else
            @po_product = PoProduct.new
        end
    end
    
    def create
        @po_product = product.po_products.build(po_product_params)
        if @po_product.save!
            redirect_to po_product_path(@po_product)
        else 
            render :new
        end
    end

    def show 
        set_po_product
    end

    def edit 
        
    end

    def update 

    end

    def destroy

    end

    private 
    def product_params
        params.require(:po_product).permit(:quantity, :user_id, :purchase_order_id)
    end

    def set_po_product
        @po_product = PoProduct.find_by(id: params[:id])
    end
end

end
