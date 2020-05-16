class PoProductsController < ApplicationController
       
    def index
        if params[:purchase_order_id] && @purchase_order = PurchaseOrder.find_by(id: params[:purchase_order_id])
            @po_products = @purchase_order.po_products
        else
            @po_products = PoProduct.all
        end
    end

    def new
        @po_product = PoProduct.new(purchase_order_id: params[:purchase_order_id])
        # if params[:purchase_order_id] && purchase_order = PurchaseOrder.find_by(id: params[:purchase_order_id])
        #     @po_product = purchase_order.products.build
        # else
        #     @po_product = PoProduct.new(purchase_order_id: params[:purchase_order_id])
        # end
    end
    
    def create
        @po_product = PoProduct.new(po_product_params)
        if @po_product.save!
            redirect_to purchase_orders_path(@po_product.purchase_order)
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
        if !@po_product
            redirect_to po_products_path
        end
    end
end