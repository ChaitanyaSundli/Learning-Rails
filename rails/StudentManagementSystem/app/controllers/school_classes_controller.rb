class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: %i[ show update destroy ]

  # GET /school_classes
  # GET /school_classes.json
  def index
    @school_classes = SchoolClass.all
  end

  # GET /school_classes/1
  # GET /school_classes/1.json
  def show
  end

  # POST /school_classes
  # POST /school_classes.json
  def create
    @school_class = SchoolClass.new(school_class_params)

    if @school_class.save
      render :show, status: :created, location: @school_class
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /school_classes/1
  # PATCH/PUT /school_classes/1.json
  def update
    if @school_class.update(school_class_params)
      render :show, status: :ok, location: @school_class
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /school_classes/1
  # DELETE /school_classes/1.json
  def destroy
    @school_class.destroy!
  end

  def get_timetable
    school_class = SchoolClass.find(params[:id])
    render json: school_class.timetables.order(:day,:start_time)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_class
      @school_class = SchoolClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_class_params
      params.require(:school_class).permit(:grade_lvl, :section, :location_id)
    end
end
