class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])

    if current_user == room.user
      flash[:notice] = "自分自身に対して申し込むことはできません。"
    # elsif current_user.stripe_id.blank?
    #   flash[:alert] = "Please update your payment method."
    #   return redirect_to payment_method_path
    else
    
      @reservation = current_user.reservations.build(reservation_params)
      @reservation.room = room
      @reservation.price = room.price

      @reservation.save

      flash[:notice] = "予約が完了しました。"
    end
    redirect_to room
  end

  def show
    @reservation = Reservation.find(params[:id])

    unless current_user == @reservation.user || current_user == @reservation.room.user
      flash[:notice] = "アクセスする権限がありません。"
      redirect_to root_path
    end

    @teacher = @reservation.room.user
    @student = @reservation.user


  end

  def advices
    @rooms = current_user.rooms
    @advices = current_user.reservations
  end

  def reservations
    @rooms = current_user.rooms
  end


  private
  def reservation_params
      params.require(:reservation).permit(:title, :content, :audio, :audio_cache)
  end
end