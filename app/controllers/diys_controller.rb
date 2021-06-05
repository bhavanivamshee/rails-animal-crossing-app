class DiysController < ApplicationController

    before_action :find_user, only: [:index, :show]


    def index
        if params[:user_id]
        @diys = @user.diys
        elsif params[:name]
            @diys = Diy.name_search(params[:name])
        else
            @diys = Diy.all
        end
    end

    def show
        if params[:user_id]
            @user.diy.find_by_id(params[:id])
        else
            @diy = Diy.find_by_id(params[:id])
        end
    end
    
    private

    def find_user
        @user = User.find_by(id: params[:user_id])
    end

    
end
