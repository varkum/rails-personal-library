class ShareController < ApplicationController
    before_action :set_user

    def articles
        @articles = @user.articles.all
    end
    
    def books
        @books = @user.books.all
    end

    def movies
        @movies = @user.movies.all
    end

    def tvshows
        @tvshows = @user.tvshows.all
    end

    def podcasts
        @podcasts = @user.podcasts.all
    end

    def tweets
        @tweets = @user.tweets.all
    end

    def not_found
    end

    private

    def set_user
        @user = User.find(params[:user_id]) 
        rescue ActiveRecord::RecordNotFound 
            render :not_found
        
    end
end