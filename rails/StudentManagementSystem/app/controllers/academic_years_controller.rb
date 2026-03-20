class AcademicYearsController < ApplicationController
  before_action :set_academic_year, only: %i[ show update destroy ]

  # GET /academic_years
  # GET /academic_years.json
  def index
    @academic_years = AcademicYear.all
  end

  # GET /academic_years/1
  # GET /academic_years/1.json
  def show
  end

  # POST /academic_years
  # POST /academic_years.json
  def create
    @academic_year = AcademicYear.new(academic_year_params)

    if @academic_year.save
      render :show, status: :created, location: @academic_year
    else
      render json: @academic_year.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /academic_years/1
  # PATCH/PUT /academic_years/1.json
  def update
    if @academic_year.update(academic_year_params)
      render :show, status: :ok, location: @academic_year
    else
      render json: @academic_year.errors, status: :unprocessable_entity
    end
  end

  # DELETE /academic_years/1
  # DELETE /academic_years/1.json
  def destroy
    @academic_year.destroy!
  end

  private
    def set_academic_year
      @academic_year = AcademicYear.find(params[:id])
    end

    def academic_year_params
      params.require(:academic_year).permit(:year_start, :year_end, :is_active)
    end
end