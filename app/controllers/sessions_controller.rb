class SessionsController < ApplicationController

    skip_before_action :logged_in, except: [:destroy]

    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_diys_path(@user)
        elsif @user
            @errors = ["Invalid Password"]
            render :new
        else
            @errors = ["Invalid Username"]
            render :new
        end
    end

    def create_with_facebook
        user = User.find_or_create_by(username: fb_auth['info']['email']) do |u|
            u.password = SecureRandom.hex(15)
        end
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_diys_path(user)
        else
            redirect_to signup_path
        end
    end

    def destroy
        session.clear
        redirect_to '/login'
    end

    private

    def fb_auth
        self.request.env['omniauth.auth']
    end
end