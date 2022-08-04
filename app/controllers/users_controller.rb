class UsersController < ApplicationController 

    #GET /profile
    def index

    end

    #GET /signup
    def new
        @user = User.new
    end

    #GET /profile/edit
    def edit 

    end

    #POST /signup
    def create
        @user = User.new(user_params)
        if @user.save!
            redirect_to home_path
        else
            render plain: "An error occured. Please try again"
           
        end
    end

    #PATCH/PUT /profile/edit
    def update

    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end