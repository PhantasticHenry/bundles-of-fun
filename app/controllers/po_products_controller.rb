class PoProductsController < ApplicationController
    before_action :logged_in?
    before_action :set_po_product, only: [:show, :edit, :update, :destroy]
    before_action :edit_or_delete, only: [:edit, :update, :destroy]
       
    def index
        if params[:purchase_order_id] && @purchase_order = PurchaseOrder.find_by(id: params[:purchase_order_id])
            @po_products = @purchase_order.po_products
        else
            @po_products = PoProduct.all
        end
    end

    def new
        @po_product = PoProduct.new(purchase_order_id: params[:purchase_order_id])
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
    end

    def edit 
    end

    def update 
        if @po_product.update(po_product_params)
            redirect_to purchase_order_po_products_path(@po_product)
        else 
            render :new
        end
    end

    def destroy
        @po_product.destroy 
        redirect_to root_path
    end

    private 
    def po_product_params
        params.require(:po_product).permit(:quantity, :product_id, :purchase_order_id, purchase_order_attributes: [:po, :bin, :start_date, :completion_date])
    end

    def set_po_product
        @po_product = PoProduct.find_by(id: params[:id])
        if !@po_product
            redirect_to po_products_path
        end
    end

    def edit_or_delete
        set_po_product
        redirect_to po_products_path, alert: "Editing permissions denied" unless !!authorized
    end

    def authorized
        helpers.current_user == @po_product.product.user
     end
end