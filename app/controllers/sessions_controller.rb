class SessionsController < ApplicationController
    #root and GET /signin
    def index
        
    end

    #POST /signin
    def create
        
        user = User.find_by(email: params[:email])
        if user.present? and user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to home_path
        else
            redirect_to signin_path, alert: "Wrong email or password. Please try again."
        end
    end

    #DELETE /signin
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

   
end