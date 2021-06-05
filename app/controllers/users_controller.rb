class UsersController < ApplicationController

    skip_before_action :redirect_user

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_diys_path(@user)
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:island_name, :username, :email, :dream_address, :password, :password_confirmation)
    end
end
