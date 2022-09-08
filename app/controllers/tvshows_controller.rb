class TvshowsController < ApplicationController
  before_action :set_tvshow, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  # GET /tvshows or /tvshows.json
  def index
    session['filters'] = {}
    @tvshows = Current.user.tvshows.all
  end

  # GET /tvshows/filter
  def filter
    session['filters'] = {} if session['filters'].blank?
    session['filters'].merge!(filter_params)
    
    @tvshows = Current.user.tvshows.all
    @tvshows = @tvshows.where("name like ?", "%#{session['filters']['search']}%") if session['filters']['search']
    @tvshows = @tvshows.where(consumed: session['filters']['show_consumed']) if session['filters']['show_consumed'].present?
    @tvshows = @tvshows.where(starred: session['filters']['show_starred']) if session['filters']['show_starred'].present?
    
    render :index
  end

  # GET /tvshows/1 or /tvshows/1.json
  def show
  end

  # GET /tvshows/new
  def new
    @tvshow = Current.user.tvshows.new
  end

  # GET /tvshows/1/edit
  def edit
  end

  # POST /tvshows or /tvshows.json
  def create
    @tvshow = Current.user.tvshows.new(tvshow_params)

    respond_to do |format|
      if @tvshow.save
        format.html { redirect_to tvshows_url }
        format.json { render :show, status: :created, location: @tvshow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tvshow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvshows/1 or /tvshows/1.json
  def update
    respond_to do |format|
      if @tvshow.update(tvshow_params)
          format.turbo_stream 
          format.html { redirect_to tvshow_url(@tvshow), notice: "tvshow was successfully updated." }
          format.json { render :show, status: :ok, location: @tvshow }
         
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tvshow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvshows/1 or /tvshows/1.json
  def destroy
    @tvshow.destroy

    respond_to do |format|
      format.html { redirect_to tvshows_url, notice: "tvshow was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvshow
      @tvshow = Current.user.tvshows.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tvshow_params
      params.require(:tvshow).permit(:name, :notes, :starred, :consumed)
    end

    def filter_params
      params.permit(:show_consumed, :show_starred, :search)
    end

    
end
