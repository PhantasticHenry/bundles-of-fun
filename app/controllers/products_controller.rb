class ProductsController < ApplicationController
    before_action :logged_in?
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :edit_or_delete, only: [:edit, :update, :destroy]

    def index 
        @products = Product.all
    end

    def bag
        @products = Product.all.bag
    end

    def harness
        @products = Product.all.harness
    end

    def new 
        @product = Product.new
    end
    
    def create
        @product = helpers.current_user.products.build(product_params)
        if @product.save
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

    def destroy 
        @product.destroy 
        redirect_to products_path
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

    def edit_or_delete
        set_product
        redirect_to products_path, alert: "Editing permissions denied" unless !!authorized
    end

    def authorized
        helpers.current_user == @product.user
     end
end