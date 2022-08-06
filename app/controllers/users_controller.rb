class UsersController < ApplicationController 

    #GET /account
    def index
        require_user_logged_in!
        @user = Current.user
    end

    #GET /signup
    def new
        @user = User.new
    end

    #GET /account/edit
    def edit 
        require_user_logged_in!
        @user = Current.user
       
    end

    #POST /signup
    def create
        
        @user = User.new(user_params)
        if @user.save!
            redirect_to home_path, notice: "Your account was successfully created. Begin by adding items to a list."
        else
            render :new
            flash[:alert] = "An error occured. Please try again."
           
        end
    end

    #PATCH/PUT /account/edit
    def update
        require_user_logged_in!
        @user = Current.user
        if @user.update(user_params)
            redirect_to account_path, notice: "Your password was successfully changed"
        else
            redirect_to account_edit_path, alert: "An error occurred. Please try again."
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

   


end