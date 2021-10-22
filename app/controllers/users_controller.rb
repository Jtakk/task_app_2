class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :account, :profile, :posts]
  before_action :correct_user, only: [:edit, :update, :account, :profile, :posts]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "新しいアカウントが作成されました"
      redirect_to home_url
    else
      render "new"
    end
  end
  
  def account
  end
  
  def profile
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "アカウントを更新しました"
      redirect_to account_user_url(@user)
    else
      render 'edit'
    end
  end
  
  def destroy
  end

  def posts
  end

  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :introduction)
    end
    
    
    # beforeアクション
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(home_url) unless current_user?(@user)
    end
end
