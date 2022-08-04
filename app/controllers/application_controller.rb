class ApplicationController < ActionController::Base
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_logged_in!
        redirect_to signin_path, alert: "Please login to continue." if Current.user.nil?
    end
end
