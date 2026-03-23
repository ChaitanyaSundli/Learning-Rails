require "test_helper"

class ExamResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_result = exam_results(:one)
  end

  test "should get index" do
    get exam_results_url, as: :json
    assert_response :success
  end

  test "should create exam_result" do
    assert_difference("ExamResult.count") do
      post exam_results_url, params: { exam_result: { Exam_id: @exam_result.Exam_id, Student_id: @exam_result.Student_id, grade: @exam_result.grade, marks_obtained: @exam_result.marks_obtained } }, as: :json
    end

    assert_response :created
  end

  test "should show exam_result" do
    get exam_result_url(@exam_result), as: :json
    assert_response :success
  end

  test "should update exam_result" do
    patch exam_result_url(@exam_result), params: { exam_result: { Exam_id: @exam_result.Exam_id, Student_id: @exam_result.Student_id, grade: @exam_result.grade, marks_obtained: @exam_result.marks_obtained } }, as: :json
    assert_response :success
  end

  test "should destroy exam_result" do
    assert_difference("ExamResult.count", -1) do
      delete exam_result_url(@exam_result), as: :json
    end

    assert_response :no_content
  end
end
