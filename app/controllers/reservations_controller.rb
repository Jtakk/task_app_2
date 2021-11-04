class ReservationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  
  def index
  end
  
  def new
    @reservation = current_user.reservations.build
    @day = (params[:end].to_date - params[:start].to_date).to_i
    @price = @day * params[:price].to_i * params[:number].to_i
  end
  
  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      flash[:success] = "部屋を予約しました"
      redirect_to reservations_path
    else
      render "new"
    end
  end
  
  def destroy
    @reservation.destroy
    flash[:success] = "予約をキャンセルしました"
    redirect_to reservations_path
  end
  
  
  
  private
  
    def reservation_params
      params.require(:reservation).permit(:room_id, :start, :end, :number)
    end
    
    
    # beforeアクション
    
    # 予約者かどうか確認
    def correct_user
      @reservation = current_user.reservations.find_by(id: params[:id])
      redirect_to home_url if @reservation.nil?
    end
  
end
