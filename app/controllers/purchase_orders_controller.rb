class PurchaseOrdersController < ApplicationController
    
    def index 
        @purchase_orders = PurchaseOrder.all
    end

    def new 
        @purchase_order = PurchaseOrder.new
    end
    
    def create
        @purchase_order = PurchaseOrder.new(po_params)
        if @purchase_order.save && !po_params.empty?
            redirect_to purchase_orders_path
        else 
            render :new
        end
    end

    private 
    def po_params
        params.require(:purchase_order).permit(:po, :bin, :start_date, :completion_date)
    end
end
