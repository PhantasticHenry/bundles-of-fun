class PoProductsController < ApplicationController
       
    def index
        if params[:purchase_order_id] && purchase_order = PurchaseOrder.find_by(id: params[:purchase_order_id])
            @po_products = purchase_order.products
        else
            @po_products = PoProduct.all
        end
    end

    def new
        # @po_product = PoProduct.new(purchase_order_id: params[:purchase_order_id])
        if params[:purchase_order_id] && purchase_order = PurchaseOrder.find_by(id: params[:purchase_order_id])
            @po_product = purchase_order.products.build
        else
            @po_product = PoProduct.new(purchase_order_id: params[:purchase_order_id])
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
    def po_product_params
        params.require(:po_product).permit(:quantity, :product_id, :purchase_order_id)
    end

    def set_po_product
        @po_product = PoProduct.find_by(id: params[:id])
    end
end