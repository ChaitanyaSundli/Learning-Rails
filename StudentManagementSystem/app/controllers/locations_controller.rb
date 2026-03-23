class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show update destroy ]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json


  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    if @location.save
      render :show, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    if @location.update(location_params)
      render :show, status: :ok, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:name, :building, :floor, :location_type)
    end

    def available
      date = params[:date]
      start_time = params[:start_time]
      end_time = params[:end_time]

      busy_ids = ClubSchedule.where(schedule_date: date)
        .where("start_time < ? AND end_time > ?", end_time, start_time)
        .pluck(:location_id)

      locations = Location.where.not(id: busy_ids)

      render json: locations
    end
end