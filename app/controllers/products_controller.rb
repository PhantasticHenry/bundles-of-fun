class ProductsController < ApplicationController

    def new 
        @product = Product.new
    end
    
    def create 
        @product = Product.new(product_params)
    end

    def show 

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
end
