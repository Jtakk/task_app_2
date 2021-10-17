class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "新しいアカウントが作成されました"
      redirect_to @user
    else
      render "new"
    end
  end
  
  def account
    @user = User.find(params[:id])
  end
  
  def profile
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    
  end
  
  def destroy
    
  end


  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :introduction)
    end
end
