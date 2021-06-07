class ApplicationController < ActionController::Base
    
    before_action :logged_in
    

    helper_method(:current_user)


    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def logged_in
        if !current_user
            redirect_to '/signup'
        end
    end


end
