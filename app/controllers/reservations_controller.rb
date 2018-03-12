class ReservationsController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    
    @reservation = current_user.reservations.build()
    @reservation.room = room
    @reservation.price = room.price

    @reservation.save

    flash[:notice] = "予約が完了しました。"
    redirect_to room

  end


  # private
  # def reservation_params
  #     params.require(:reservation).permit()
  # end
end