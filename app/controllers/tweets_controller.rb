class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  # GET /tweets or /tweets.json
  def index
    session['filters'] = {}
    @tweets = Current.user.tweets.all
  end

  # GET /tweets/filter
  def filter
    session['filters'] = {} if session['filters'].blank?
    session['filters'].merge!(filter_params)
    
    @tweets = Current.user.tweets.all
    @tweets = @tweets.where("author like ?", "%#{session['filters']['search']}%") if session['filters']['search']
    @tweets = @tweets.where(consumed: session['filters']['show_consumed']) if session['filters']['show_consumed'].present?
    @tweets = @tweets.where(starred: session['filters']['show_starred']) if session['filters']['show_starred'].present?
    
    render :index
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Current.user.tweets.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Current.user.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
          format.turbo_stream 
          format.html { redirect_to tweet_url(@tweet)}
          format.json { render :show, status: :ok, location: @tweet }
         
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Current.user.tweets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:author, :url, :notes, :starred, :consumed)
    end

    def filter_params
      params.permit(:show_consumed, :show_starred, :search)
    end

    
end
