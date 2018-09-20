class Api::TripsController < ApplicationController
  before_action :authenticate_user

  def index
    @trips = current_user.trips
    render "index.json.jbuilder"
  end

  def create
    trip = Trip.new(
      location: params[:location],
      description: params[:description],
    )
    if trip.save
      render json: {message: 'Trip created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    @trip.location = params["location"] || @trip.location
    @trip.description = params["description"] || @trip.description
  
    if @trip.save
      render "show.json.jbuilder"
    else
      render json: {error: @trip.errors.full_messages}, status: 404
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy
    render json: {message: "Your account has been deleted."}
  end
end
