class MaterialsController < ApplicationController

    def index
        @materials = Material.all
        @diys = Diy.all
    end

    def new
        if params[:diy_id]
            @diy = Diy.find_by(id: params[:diy_id])
            @material = @diy.materials.build
        else
            @material = Material.new
        end
    end

    def create
        @material = Material.create(material_params)
        @material.user = current_user
        if params[:diy_id]
            @material.diy_id = params[:diy_id]
        end
        if @material.save
        redirect_to materials_path
        else
            render :new
        end
    end

    private

    def material_params
        params.require(:material).permit(:name, :count, :diy_id, :user_id)
    end
end
