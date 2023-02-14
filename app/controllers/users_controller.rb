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
    is_matching_login_user
    @user = User.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "user update successfully"
      redirect_to user_path(@user.id)
    else
      @users = User.all
      render :edit
    end
  end

  private
  
  def is_matching_login_user
    user_id = User.find(params[:id])
    unless user_id == current_user
      redirect_to new_user_session_path
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
