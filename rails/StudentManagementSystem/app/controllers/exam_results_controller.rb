class ExamResultsController < ApplicationController
  before_action :set_exam_result, only: %i[ show update destroy ]

  # GET /exam_results
  # GET /exam_results.json
  def index
    @exam_results = ExamResult.all
  end

  # GET /exam_results/1
  # GET /exam_results/1.json
  def show
  end

  # POST /exam_results
  # POST /exam_results.json
  def create
    @exam_result = ExamResult.new(exam_result_params)

    if @exam_result.save
      render :show, status: :created, location: @exam_result
    else
      render json: @exam_result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exam_results/1
  # PATCH/PUT /exam_results/1.json
  def update
    if @exam_result.update(exam_result_params)
      render :show, status: :ok, location: @exam_result
    else
      render json: @exam_result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exam_results/1
  # DELETE /exam_results/1.json
  def destroy
    @exam_result.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_result
      @exam_result = ExamResult.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def exam_result_params
      params.expect(exam_result: [ :Student_id, :Exam_id, :marks_obtained, :grade ])
    end
end
