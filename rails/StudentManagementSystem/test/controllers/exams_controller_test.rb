require "test_helper"

class ExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam = exams(:one)
  end

  test "should get index" do
    get exams_url, as: :json
    assert_response :success
  end

  test "should create exam" do
    assert_difference("Exam.count") do
      post exams_url, params: { exam: { Subject_id: @exam.Subject_id, end_time: @exam.end_time, exam_date: @exam.exam_date, exam_type: @exam.exam_type, max_mark: @exam.max_mark, pass_mark: @exam.pass_mark, start_time: @exam.start_time } }, as: :json
    end

    assert_response :created
  end

  test "should show exam" do
    get exam_url(@exam), as: :json
    assert_response :success
  end

  test "should update exam" do
    patch exam_url(@exam), params: { exam: { Subject_id: @exam.Subject_id, end_time: @exam.end_time, exam_date: @exam.exam_date, exam_type: @exam.exam_type, max_mark: @exam.max_mark, pass_mark: @exam.pass_mark, start_time: @exam.start_time } }, as: :json
    assert_response :success
  end

  test "should destroy exam" do
    assert_difference("Exam.count", -1) do
      delete exam_url(@exam), as: :json
    end

    assert_response :no_content
  end
end
