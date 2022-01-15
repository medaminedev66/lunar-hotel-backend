class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: :destroy

  def index
    @reservations = current_user.reservations
  end

  def show; end

  def create
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      render :show, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:nights, :check_in, :check_out, :room_id)
  end
end
