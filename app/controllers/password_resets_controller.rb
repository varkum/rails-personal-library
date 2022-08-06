class PasswordResetsController < ApplicationController
    #GET '/reset_password'
    def index

    end

    #POST '/reset_password'
    def create
        user = User.find_by(email: params[:email])

        if user.present?
            
            PasswordMailer.with(user: user).reset.deliver_later
            redirect_to signin_path, notice: "A reset link was sent to your email. The link expires in 15 minutes."
        else 
            flash[:alert] = "No account was found for that email address. Please try again."
            redirect_to reset_password_path
    
        end
    end

    #GET '/reset_password?token'
    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to signin_path, alert: "Your reset link has expired. Please try again."
     
    end

    #PATCH '/reset_password?token'
    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to signin_path, notice: "Your password was reset successfully."
        else 
            redirect_to reset_password_edit_path, alert: "Something went wrong. Please try again."
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end