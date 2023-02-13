class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all

    @user = User.find(current_user.id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "book create successfully"
    redirect_to book_path(@book.id)
  end

  def show
    @user = User.find(current_user.id)
    @book = Book.new
    @book_show = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "book update successfully"
    redirect_to book_path(book.id)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
