class MaterialsController < ApplicationController

    before_action :set_material, only: [:show, :edit, :update, :destroy]

    def index 
        @materials = Material.all
    end

    def new 
        @material = Material.new
    end
    
    def create
        @material = Material.new(material_params)
        if @material.save && !material_params.empty?
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
    
    end

    private 
    def material_params
        params.require(:material).permit(:name, :color, :size, :sku, :category )
    end

    def set_material
        @material = Material.find_by(id: params[:id])
        if !@material 
            reidrect_to materials_path
        end
    end


end
