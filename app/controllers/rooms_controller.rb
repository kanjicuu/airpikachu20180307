class RoomsController < ApplicationController
  
  before_action :set_room ,except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:basic, :pricing, :description, :photo_upload, :youtube, :teacher, :update]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to basic_room_path(@room), notice: '保存されました！'
    else
      render :new, notice: '間違いがあります。もう一度やり直してください。'
    end
  end

  def show
    @user = @room.user
    @photos = @room.roomphotos

    @student_reviews = @room.student_reviews
  end

  def basic
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photo = Roomphoto.new
  end

  def youtube
  end

  def teacher
  end

  def personalinfo
    @user = current_user
  end

  def teacherinfo
    @user = current_user
  end

  def update

    # new_params = room_params
    # new_params = room_params.merge(active: true) if is_ready_room

    if @room.update(room_params)
      flash[:notice]='Saved...'
    else
      flash[:notice]='Something went wrong...'
    end

    redirect_back(fallback_location: request.referer)

  end

  private 
    def set_room
      @room = Room.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You don't have permission" unless current_user.id == @room.user_id
    end

    def room_params
      params.require(:room).permit(:instrument, :summary, :teach_years , :exp_years, :price, :youtube1, :youtube2, :youtube3, :begginer, :middle, :expert, :teacher_apply, :teacher_auth, :active)
    end
end
