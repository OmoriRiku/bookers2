class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def user_params
    params.require(:users).permit(:name, :introduction, :image)
  end
end
