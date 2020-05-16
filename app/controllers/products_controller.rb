class ProductsController < ApplicationController

    before_action :logged_in?, only: [:edit, :destroy]
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index 
        @products = Product.all
    end

    def new 
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        if @product.save && !product_params.empty?
            redirect_to products_path
        else 
            render :new
        end
    end

    def show
        
    end

    def edit 

    end

    def update
 
    end

    private 
    def product_params
        params.require(:product).permit(:name, :color, :size, :sku, :category )
    end

    def set_product
        @product = Product.find_by(id: params[:id])
    end
end