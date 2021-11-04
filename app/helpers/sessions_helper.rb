module SessionsHelper
  
  # userでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # ログイン中のユーザーを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ユーザーがログインしていればtrueを返す
  def logged_in?
    !current_user.nil?
  end
  
  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # 渡されたユーザーがcurrentユーザーであればtrueを返す
  def current_user?(user)
    user && user == current_user
  end
end
