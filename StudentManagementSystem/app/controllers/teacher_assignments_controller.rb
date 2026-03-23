class TeacherAssignmentsController < ApplicationController
  before_action :set_teacher_assignment, only: %i[ show update destroy ]

  # GET /teacher_assignments
  # GET /teacher_assignments.json
  def index
    @teacher_assignments = TeacherAssignment.all
  end

  # GET /teacher_assignments/1
  # GET /teacher_assignments/1.json
  def show
  end

  # POST /teacher_assignments
  # POST /teacher_assignments.json
  def create
    @teacher_assignment = TeacherAssignment.new(teacher_assignment_params)

    if @teacher_assignment.save
      render :show, status: :created, location: @teacher_assignment
    else
      render json: @teacher_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teacher_assignments/1
  # PATCH/PUT /teacher_assignments/1.json
  def update
    if @teacher_assignment.update(teacher_assignment_params)
      render :show, status: :ok, location: @teacher_assignment
    else
      render json: @teacher_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teacher_assignments/1
  # DELETE /teacher_assignments/1.json
  def destroy
    @teacher_assignment.destroy!
  end

  private
    def set_teacher_assignment
      @teacher_assignment = TeacherAssignment.find(params[:id])
    end

    def teacher_assignment_params
      params.require(:teacher_assignment).permit(:teacher_id, :class_subject_id, :academic_year_id)
    end
end