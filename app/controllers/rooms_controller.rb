class RoomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_room, only: :destroy

  def index
    @rooms = current_user.rooms.all
  end

  def show
  end

  def create
    @room = current_user.rooms.new(room_params)

    if @room.save
      render :show, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :city, :rate, :type, :amenities, :picture, :user_id)
  end
end
