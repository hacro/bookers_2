class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:mkBookSuccess] = "successfully created!"
    else
      @books = Book.all
      render :index
      flash[:mkBookError] = "error create..."
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:editBookSuccess] = "successfully edited!"
    else
      @book = Book.find(params[:id])
      render :show
      flash[:editBookError] = "error edit..."
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
