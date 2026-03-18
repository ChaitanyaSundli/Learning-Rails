class ClubSchedulesController < ApplicationController
  before_action :set_club_schedule, only: %i[ show update destroy ]

  # GET /club_schedules
  # GET /club_schedules.json
  def index
    @club_schedules = ClubSchedule.all
  end

  # GET /club_schedules/1
  # GET /club_schedules/1.json
  def show
  end

  # POST /club_schedules
  # POST /club_schedules.json
  def create
    @club_schedule = ClubSchedule.new(club_schedule_params)

    if @club_schedule.save
      render :show, status: :created, location: @club_schedule
    else
      render json: @club_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /club_schedules/1
  # PATCH/PUT /club_schedules/1.json
  def update
    if @club_schedule.update(club_schedule_params)
      render :show, status: :ok, location: @club_schedule
    else
      render json: @club_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /club_schedules/1
  # DELETE /club_schedules/1.json
  def destroy
    @club_schedule.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_schedule
      @club_schedule = ClubSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def club_schedule_params
      params.require(:club_schedule).permit(:club_id, :activity_type, :schedule_date, :start_time, :end_time, :location_id)
    end
end
