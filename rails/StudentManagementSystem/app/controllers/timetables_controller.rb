class TimetablesController < ApplicationController
  before_action :set_timetable, only: %i[ show update destroy ]



  # GET /timetables
  # GET /timetables.json
  def index
    @timetables = Timetable.includes(:subject, :teacher, :school_class, :time_slot)
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
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    def timetable_params
      params.require(:timetable).permit( :class_subject_id, :academic_year_id, :time_slot_id, :day_of_week)
    end

    def available_teachers
      day = params[:day_of_week]
      time_slot_id = params[:time_slot_id]
      academic_year_id = params[:academic_year_id]

      busy_teacher_ids = Timetable.joins(class_subject: :teacher_assignment)
        .where(
          day_of_week: day,
          time_slot_id: time_slot_id,
          academic_year_id: academic_year_id
        )
        .pluck("teacher_assignments.teacher_id")

      teachers = Teacher.where.not(id: busy_teacher_ids)

      render json: teachers
    end

    def available_class_subjects
      day = params[:day_of_week]
      time_slot_id = params[:time_slot_id]
      academic_year_id = params[:academic_year_id]

      busy_ids = Timetable.where(
        day_of_week: day,
        time_slot_id: time_slot_id,
        academic_year_id: academic_year_id
      ).pluck(:class_subject_id)

      subjects = ClassSubject.where(academic_year_id: academic_year_id)
                             .where.not(id: busy_ids)

      render json: subjects
    end

    def available_class_subjects
      day = params[:day_of_week]
      time_slot_id = params[:time_slot_id]
      academic_year_id = params[:academic_year_id]

      busy_ids = Timetable.where(
        day_of_week: day,
        time_slot_id: time_slot_id,
        academic_year_id: academic_year_id
      ).pluck(:class_subject_id)

      subjects = ClassSubject.where(academic_year_id: academic_year_id)
                             .where.not(id: busy_ids)

      render json: subjects
    end
end