class ItemsController < ApplicationController
    before_action :require_user_logged_in!

    def index
        @books = Current.user.books.where(consumed: false)
        @movies = Current.user.movies.where(consumed: false)
        @articles = Current.user.articles.where(consumed: false)
        @podcasts = Current.user.podcasts.where(consumed: false)
        @tweets = Current.user.tweets
        @tvshows = Current.user.tvshows.where(consumed: false)
    end


    def new
    end

    def create 
        case params[:type]
        when "Book"
        when "Movie"
            @movie = Movie.new
            render partial: "movies/form", locals: {movie: @movie, viewing: false, source: "new"}
        end
    end
end 