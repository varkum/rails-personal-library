class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  # GET /movies or /movies.json
  def index
    session['filters'] = {}
    @movies = Current.user.movies.all
  end

  def filter
    session['filters'] = {} if session['filters'].blank?
    session['filters'].merge!(filter_params)

    @movies = Current.user.movies.all
    @movies = @movies.where("name like ?", "%#{session['filters']['search']}%") if session['filters']['search']
    @movies = @movies.where(consumed: session['filters']['show_consumed']) if session['filters']['show_consumed'].present?
    @movies = @movies.where(starred: session['filters']['show_starred']) if session['filters']['show_starred'].present?

    render :index

  end
  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Current.user.movies.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Current.user.movies.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_url }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    @movies = Current.user.movies.where(consumed:false)
    respond_to do |format|
      if @movie.update(movie_params)
        format.turbo_stream
        format.html { redirect_to movie_url(@movie) }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:name, :notes, :starred, :consumed)
    end

    def filter_params
      params.permit(:search, :show_consumed, :show_starred)
    end
end
