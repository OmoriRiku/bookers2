class UsersController < ApplicationController
  def index
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
