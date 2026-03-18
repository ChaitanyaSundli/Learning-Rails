class TimetablesController < ApplicationController
  before_action :set_timetable, only: %i[ show update destroy ]

  # GET /timetables
  # GET /timetables.json
  def index
    @timetables = Timetable.all
  end

  # GET /timetables/1
  # GET /timetables/1.json
  def show
  end

  # POST /timetables
  # POST /timetables.json
  def create
    @timetable = Timetable.new(timetable_params)

    if @timetable.save
      render :show, status: :created, location: @timetable
    else
      render json: @timetable.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /timetables/1
  # PATCH/PUT /timetables/1.json
  def update
    if @timetable.update(timetable_params)
      render :show, status: :ok, location: @timetable
    else
      render json: @timetable.errors, status: :unprocessable_entity
    end
  end

  # DELETE /timetables/1
  # DELETE /timetables/1.json
  def destroy
    @timetable.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def timetable_params
      params.expect(timetable: [ :SchoolClass_id, :Teacher_id, :Subject_id, :day, :start_time, :end_time ])
    end
end
