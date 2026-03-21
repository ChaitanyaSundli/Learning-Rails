class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show update destroy ]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    render_success(@students, "Students Recieved")
  end

  # GET /students/1
  # GET /students/1.json
  def show
    return unless @student
    render_success(@student)
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      render_success(@student,:created, "Student ID Created")
    else
      render_error(@student.errors.full_messages)
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    return unless @student
    if @student.update(student_params)
      render_success(@student, :ok, "Student ID Updated")
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy!
    render_success(@student)
  end

  def get_timetable
    @student = Student.find(params[:id])
    render json: @student.timetables.order(:day_of_week, :time_slot_id)
  end
  
  def login
    @student = Student.find_by(id: params[:id], password: params[:password])
    if @student
      render json: @student
    else
      render json: {message: "Invalid Credentials"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :dob, :phone, :address, :password)
    end

end