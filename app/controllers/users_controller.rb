class UsersController < ApplicationController 

    #GET /profile
    def index
        require_user_logged_in!
        @user = Current.user
    end

    #GET /signup
    def new
        @user = User.new
    end

    #GET /profile/edit
    def edit 
        require_user_logged_in!
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

    #PATCH/PUT /profile/edit
    def update
        require_user_logged_in!
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end