class PagesController < ApplicationController
  def home
  	@rooms = Room.where(active: true, teacher_auth: true).limit(5)
  	@q = Room.ransack(params[:q])
  end

  def search
  	@rooms_all = Room.where(active: true, teacher_auth: true).all

  	@search = @rooms_all.ransack(params[:q])
    @rooms = @search.result

    @arrRooms = @rooms.to_a

  end

end
