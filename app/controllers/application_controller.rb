class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_q
  
  def set_q
    @q = Room.ransack(params[:q])
  end
  
  private
  
    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end
