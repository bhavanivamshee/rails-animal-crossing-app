class DiysController < ApplicationController

    def index
        @diys = Diy.all
    end

    def show
        @diy = Diy.find_by_id(params[:id])
    end
    
end
