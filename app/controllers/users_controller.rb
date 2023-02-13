class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book_show = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "user update successfully"
      redirect_to user_path(current_user.id)
    else
      @users = User.all
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
