class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  # GET /books or /books.json
  def index
    
    @books = Current.user.books.all
    @books = @books.where(consumed: params[:show_consumed]) if params[:show_consumed].present?
    @books = @books.where(starred: params[:show_starred]) if params[:show_starred].present?

    
  end

  # GET /books/filter
  def filter
    @books = Current.user.books.all
    @books = Current.user.books.where("title like ?", "%#{params[:search]}%").or(Current.user.books.where("author like ?", "%#{params[:search]}%")) if params[:search]
    @books = Current.user.books.where(consumed: params[:show_consumed]) if params[:show_consumed].present?
    @books = Current.user.books.where(starred: params[:show_starred]) if params[:show_starred].present?
    
    render :index
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Current.user.books.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Current.user.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_url }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
          format.turbo_stream 
          format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
          format.json { render :show, status: :ok, location: @book }
         
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Current.user.books.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :notes, :starred, :consumed)
    end

    
end
