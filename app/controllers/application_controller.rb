class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
        flash[:alert] = nil
        flash[:notice] = "This is a notice!"
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_logged_in!
        redirect_to signin_path, alert: "Please login to continue." if Current.user.nil?
    end

    def clear_messages
        flash[:alert] = nil
        flash[:notice] = nil
    end
end
