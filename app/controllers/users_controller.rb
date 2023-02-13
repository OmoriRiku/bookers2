class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    
    @users = User.all
  end
  
  def show
    @user = User.find(current_user.id)
    @book = Book.new
    @book_show = @user.books
  end
  
  def edit
    @user = User.new
    @user.id = current_user.id
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
