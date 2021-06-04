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
        @diy = Diy.find_by_id(params[:id])
    end

end
