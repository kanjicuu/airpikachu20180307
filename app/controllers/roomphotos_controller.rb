class RoomphotosController < ApplicationController
  def create
      @photo = Roomphoto.new(roomphoto_params)
      if @photo.save
          render json: { message: "success", photoId: @photo.id }, status: 200
      else
          render json: { error: @photo.errors.full_messages.join(", ") }, status: 400
      end
  end

  def destroy
      @photo = Roomphoto.find(params[:id])
      if @photo.destroy
          render json: { message: "file deleted from server" }
      else
          render json: { message: @photo.errors.full_messages.join(", ") }
      end
  end

  def list
      room = Room.find(params[:room_id])

      photos = []
      Roomphoto.where(room_id: room.id).each do |photo|
          new_photo = {
              id: photo.id,
              name: photo.image_file_name,
              size: photo.image_file_size,
              src: photo.image(:thumb)
          }
          photos.push(new_photo)
      end
      render json: { images: photos }
  end

  private
  def roomphoto_params
      params.require(:roomphoto).permit(:image, :room_id)
  end
end