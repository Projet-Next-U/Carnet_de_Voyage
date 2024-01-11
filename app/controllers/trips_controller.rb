# trips_controller.rb
class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to @trip, notice: 'Ce voyage a été créer.'
    else
      render :new
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Ce voyage a été modifié.'
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path, notice: 'Le voyage a été supprimé avec succès.'
  end  

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:destination, :description, :date_debut, :date_fin, :user_id)
    end
end
