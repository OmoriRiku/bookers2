class BooksController < ApplicationController
  before_action :is_matching_book_user, only: [:edit, :update]

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "book create successfully"
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user = @book_show.user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "book update successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def is_matching_book_user
    book_id = Book.find(params[:id])
    unless book_id.user == current_user
      redirect_to books_path
    end
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
