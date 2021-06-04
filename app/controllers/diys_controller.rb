class DiysController < ApplicationController

    def index
        if params[:user_id]
        user = User.find_by(id: params[:user_id])
        @diys = user.diys
        else
        @diys = Diy.all
        end
    end

    def show
        if params[:user_id]
            @user = User.findby(id: params[:user_id])
            @diy = Diy.find_by_id(params[:id])
        else
            @diy = Diy.find_by_id(params[:id])
        end
    end

end
