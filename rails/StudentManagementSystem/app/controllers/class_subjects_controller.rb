class ClassSubjectsController < ApplicationController
  before_action :set_class_subject, only: %i[ show update destroy ]

  # GET /class_subjects
  # GET /class_subjects.json
  def index
    @class_subjects = ClassSubject.all
  end

  # GET /class_subjects/1
  # GET /class_subjects/1.json
  def show
  end

  # POST /class_subjects
  # POST /class_subjects.json
  def create
    @class_subject = ClassSubject.new(class_subject_params)

    if @class_subject.save
      render :show, status: :created, location: @class_subject
    else
      render json: @class_subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /class_subjects/1
  # PATCH/PUT /class_subjects/1.json
  def update
    if @class_subject.update(class_subject_params)
      render :show, status: :ok, location: @class_subject
    else
      render json: @class_subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /class_subjects/1
  # DELETE /class_subjects/1.json
  def destroy
    @class_subject.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_subject
      @class_subject = ClassSubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_subject_params
      params.require(:class_subject).permit(:school_class_id, :subject_id, :credit, :syllabus)    
    end
end
