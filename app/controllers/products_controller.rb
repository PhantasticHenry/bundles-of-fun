class ProductsController < ApplicationController
    
    def index 
        @product = Product.all
    end

    def new
        if params[:purchase_order_id] && purchase_order = PurchaseOrder.find_by(id: params[:purchase_order_id])
        # @purchase_order = PurchaseOrder.find_by(id: params[:purchase_order_id])
        
        # if @purchase_order
            @product = purchase_order.products.build
        else
            @product = Product.new
        end
    end
    
    def create
        # @product = @purchase_order.products.build(product_params)
        @product = helpers.current_user.products.build(product_params)
        # raise params.inspect
        if @product.save!
            redirect_to product_path(@product)
        else 
            render :new
        end
    end

    def show 
        set_product
    end

    def edit 
        
    end

    def update 

    end

    def destroy

    end

    private 
    def product_params
        params.require(:product).permit(:name, :color, :size, :sku, :category, :user_id, :purchase_order_id)
    end

    def set_product
        @product = Product.find_by(id: params[:id])
    end
end
