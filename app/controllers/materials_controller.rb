class MaterialsController < ApplicationController

    before_action :redirect_user

    def index
        if params[:name]
            @materials = Material.name_search(params[:name])
            @diys = Diy.all
        else
        @materials = Material.all
        @diys = Diy.all
        end
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
        @material = current_user.materials.build(material_params)
        if @material.save
        redirect_to user_diys_path(@material.user)
        else
            render :new
        end
    end

    def edit
            @material = Material.find_by(id: params[:id])
            redirect_to '/diys' unless @material.user == current_user
    end

    def update
        @material = Material.find_by(id: params[:id])
        @material.user = current_user
        if @material.update(material_params)
            redirect_to user_diys_path(@material.user)
        else
            render :edit
        end
    end

    private

    def material_params
        params.require(:material).permit(:name, :count, :complete, :diy_id, :user_id)
    end
end
