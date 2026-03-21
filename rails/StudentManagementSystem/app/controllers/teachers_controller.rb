class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show update destroy ]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      render :show, status: :created, location: @teacher
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    if @teacher.update(teacher_params)
      render :show, status: :ok, location: @teacher
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy!
  end

  def students_with_poor_performance
      the_five_worst = Student
      .joins(exam_results: :exam)
      .where(exam_results: { academic_year_id: params[:academic_year_id] })
      .select("
        students.*,
        SUM(exam_results.marks_obtained) * 1.0 / SUM(exams.max_mark) * 100 AS weighted_avg
      ")
      .group("students.id")
      .order("weighted_avg ASC")
      .limit(5)
      render_success(the_five_worst,:ok,"The Five NoN Performing Asset")
  end

  def classwise_top_5_absentees
    year_id = params[:academic_year_id]
  
    result = SchoolClass.all.map do |cls|
      students = Student
        .joins(:enrollments)
        .where(enrollments: { school_class_id: cls.id, academic_year_id: year_id })
        .joins(:attendances)
        .where(attendances: { academic_year_id: year_id, status: "absent" })
        .group("students.id")
        .select("students.*, COUNT(attendances.id) AS absences_count")
        .order("absences_count DESC")
        .limit(5)
        {
          class: "Grade #{cls.grade_lvl}-#{cls.section}",
          students: students.map do |s|
            {
              name: s.name,
              absences: s.absences_count.to_i
            }
          end
        }
        end
      render_success(result, :ok,"ClassWise Top 5 Absentees")
  end

  def teacher_performance
    year_id = params[:academic_year_id]

    teachers = Teacher
      .joins(teacher_assignments: { class_subject: { exams: :exam_results } })
      .where(teacher_assignments: { academic_year_id: year_id })
      .where(exams: { academic_year_id: year_id })
      .where(exam_results: { academic_year_id: year_id })
      .group("teachers.id")
      .select(
        "teachers.id, teachers.name,
         SUM(exam_results.marks_obtained) AS total_marks,
         SUM(exams.max_mark) AS total_max_marks"
      )
    result = teachers.map do |t|
      avg_percentage = (t.total_marks.to_f / t.total_max_marks * 100).round(2)
      {
        teacher: t.name,
        avg_score_percentage: avg_percentage
      }
    end

    render_success(result,:ok,"Teacher Performance")
    end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:name, :dob, :phone, :email, :department_id, :is_hod, :password)
    end
end