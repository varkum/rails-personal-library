class PodcastsController < ApplicationController
  before_action :set_podcast, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  # GET /podcasts or /podcasts.json
  def index
    session['filters'] = {}
    @podcasts = Current.user.podcasts.all
  end

  # GET /podcasts/filter
  def filter
    session['filters'] = {} if session['filters'].blank?
    session['filters'].merge!(filter_params)
    
    @podcasts = Current.user.podcasts.all
    @podcasts = @podcasts.where("title like ?", "%#{session['filters']['search']}%").or(@podcasts.where("podcast like ?", "%#{session['filters']['search']}%")) if session['filters']['search']
    @podcasts = @podcasts.where(consumed: session['filters']['show_consumed']) if session['filters']['show_consumed'].present?
    @podcasts = @podcasts.where(starred: session['filters']['show_starred']) if session['filters']['show_starred'].present?
    
    render :index
  end

  # GET /podcasts/1 or /podcasts/1.json
  def show
  end

  # GET /podcasts/new
  def new
    @podcast = Current.user.podcasts.new
  end

  # GET /podcasts/1/edit
  def edit
  end

  # POST /podcasts or /podcasts.json
  def create
    @podcast = Current.user.podcasts.new(podcast_params)

    respond_to do |format|
      if @podcast.save
        format.html { redirect_to podcasts_url }
        format.json { render :show, status: :created, location: @podcast }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /podcasts/1 or /podcasts/1.json
  def update
    respond_to do |format|
      if @podcast.update(podcast_params)
          @podcasts = Current.user.podcasts.where(consumed: false)
          format.turbo_stream 
          format.html { redirect_to podcast_url(@podcast) }
          format.json { render :show, status: :ok, location: @podcast }
         
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /podcasts/1 or /podcasts/1.json
  def destroy
    @podcast.destroy

    respond_to do |format|
      format.html { redirect_to podcasts_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Current.user.podcasts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def podcast_params
      params.require(:podcast).permit(:name, :podcast, :url, :notes, :starred, :consumed)
    end

    def filter_params
      params.permit(:show_consumed, :show_starred, :search)
    end

    
end
