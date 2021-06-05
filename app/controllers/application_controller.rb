class ApplicationController < ActionController::Base
    
    before_action :redirect_user 
    

    helper_method(:current_user)


    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!@current_user 
    end

    def redirect_user
        if !!logged_in?
        redirect_to signup_path
        end
    end


end
