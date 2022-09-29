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
        when "Article"
            @article = Current.user.articles.new
            render partial: "articles/form", locals: {article: @article, viewing: false, source: "new"}
        when "Book"
            @book = Current.user.books.new
            render partial: "books/form", locals: {book: @book, viewing: false, source: "new"}
        when "Movie"
            @movie = Current.user.movies.new
            render partial: "movies/form", locals: {movie: @movie, viewing: false, source: "new"}
        when "TV Show"
            @tvshow = Current.user.tvshows.new
            render partial: "tvshows/form", locals: {tvshow: @tvshow, viewing: false, source: "new"}
        when "Podcast"
            @podcast = Current.user.podcasts.new
            render partial: "podcasts/form", locals: {podcast: @podcast, viewing: false, source: "new"}
        end
    end
end 