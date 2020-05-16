class ProductsController < ApplicationController

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
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            render :new
        end
    end

    private 
    def product_params
        params.require(:product).permit(:name, :color, :size, :sku, :category )
    end

    def set_product
        @product = Product.find_by(id: params[:id])
        if !@product
            redirect_to products_path
        end
    end

    def authorized
       helpers.current_user == @user
    end

    def can_edit
        set_product
        redirect_to products_path, alert: "Editing permissions denied" unless !!authorized
    end
end