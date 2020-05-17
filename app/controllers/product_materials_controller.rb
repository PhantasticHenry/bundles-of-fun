class ProductMaterialsController < ApplicationController
    before_action :logged_in?
    before_action :set_product_material, only: [:show, :edit, :update, :destroy]
    before_action :edit_or_delete, only: [:edit, :update, :destroy]
       
    def index
        if params[:product_id] && @product = Product.find_by(id: params[:product_id])
            @product_materials = @product.product_materials
        else
            @product_materials = ProductMaterial.all
        end
    end

    def new
        @product_material = ProductMaterial.new(product_id: params[:product_id])
    end
    
    def create
        @product_material = ProductMaterial.new(pm_params)
        if @product_material.save!
            redirect_to materials_path
        else
            render :new
        end
    end

    def show 
    end

    def edit 
    end

    def update 
        if @product_material.update(pm_params)
            redirect_to purchase_order_po_products_path(@product_material)
        else 
            render :new
        end
    end

    def destroy
        @product_material.destroy 
        redirect_to root_path
    end

    private 
    def pm_params
        params.require(:product_material).permit(:quantity, :product_id, :material_id)
    end

    def set_product_material
        @product_material = ProductMaterial.find_by(id: params[:id])
        if !@product_material
            redirect_to materials_path
        end
    end

    def edit_or_delete
        set_product_material
        redirect_to materials_path, alert: "Editing permissions denied" unless !!authorized
    end

    def authorized
        helpers.current_user == @product_material.product.user
     end
end
