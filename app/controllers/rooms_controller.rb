class RoomsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def home
  end
  
  def new
    @room = current_user.rooms.build
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "新しい部屋を登録しました"
      redirect_to posts_user_url(current_user)
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @room.update(room_params)
      flash[:success] = "更新しました"
      redirect_to posts_user_url(current_user)
    else
      render 'edit'
    end
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def index
    @rooms = Room.all
  end
  
  def destroy
    @room.destroy
    flash[:success] = "削除しました"
    redirect_to posts_user_url(current_user)
  end
  
  
  
  
  private
  
    def room_params
      params.require(:room).permit(:name, :introduction, :price, :address, :image)
    end
    
    # room登録者かどうか確認
    def correct_user
      @room = current_user.rooms.find_by(id: params[:id])
      redirect_to home_url if @room.nil?
    end
end
