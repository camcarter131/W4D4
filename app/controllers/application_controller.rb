class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout_user!
        session[:session_token] = nil
        if current_user
            @current_user.reset_session_token!
        end
        @current_user = nil
    end

    # def delete_band!


    def logged_in?
        !!(current_user)
    end

    def name_taken?(name)
        !!(Band.find_by(name: name))
    end
end
