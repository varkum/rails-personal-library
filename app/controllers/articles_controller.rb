class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  # GET /articles or /articles.json
  def index
    session['filters'] = {}
    @articles = Current.user.articles.all
  end

  # GET /articles/filter
  def filter
    session['filters'] = {} if session['filters'].blank?
    session['filters'].merge!(filter_params)
    
    @articles = Current.user.articles.all
    @articles = @articles.where("title like ?", "%#{session['filters']['search']}%").or(@articles.where("author like ?", "%#{session['filters']['search']}%")) if session['filters']['search']
    @articles = @articles.where(consumed: session['filters']['show_consumed']) if session['filters']['show_consumed'].present?
    @articles = @articles.where(starred: session['filters']['show_starred']) if session['filters']['show_starred'].present?
    
    render :index
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Current.user.articles.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Current.user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_url }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @articles = Current.user.articles.where(consumed:false)
    respond_to do |format|
      if @article.update(article_params)
          format.turbo_stream 
          format.html { redirect_to article_url(@article), notice: "article was successfully updated." }
          format.json { render :show, status: :ok, location: @article }
         
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "article was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Current.user.articles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :author, :url, :notes, :starred, :consumed)
    end

    def filter_params
      params.permit(:show_consumed, :show_starred, :search)
    end

    
end
