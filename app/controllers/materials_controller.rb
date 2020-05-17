class MaterialsController < ApplicationController
    before_action :logged_in?
    before_action :set_material, only: [:show, :edit, :update, :destroy]
    before_action :edit_or_delete, only: [:edit, :update, :destroy]

    def index 
        @materials = Material.all
    end

    def new 
        @material = Material.new
    end
    
    def create
        @material = helpers.current_user.materials.build(material_params)
        if @material.save
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
        if @material.update(material_params)
            redirect_to material_path(@material)
        else 
            render :new
        end
    end

    def destroy 
        @material.destroy 
        redirect_to materials_path
    end

    private 
    def material_params
        params.require(:material).permit(:name, :color, :size, :sku, :category )
    end

    def set_material
        @material = Material.find_by(id: params[:id])
        if !@material 
            redirect_to materials_path
        end
    end

    def edit_or_delete 
        set_material
        redirect_to materials_path, alert: "Editing permissions denied" unless !!authorized 
    end

    def authorized 
        helpers.current_user == @material.user
    end


end
