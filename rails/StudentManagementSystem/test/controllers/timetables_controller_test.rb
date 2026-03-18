require "test_helper"

class TimetablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timetable = timetables(:one)
  end

  test "should get index" do
    get timetables_url, as: :json
    assert_response :success
  end

  test "should create timetable" do
    assert_difference("Timetable.count") do
      post timetables_url, params: { timetable: { SchoolClass_id: @timetable.SchoolClass_id, Subject_id: @timetable.Subject_id, Teacher_id: @timetable.Teacher_id, day: @timetable.day, end_time: @timetable.end_time, start_time: @timetable.start_time } }, as: :json
    end

    assert_response :created
  end

  test "should show timetable" do
    get timetable_url(@timetable), as: :json
    assert_response :success
  end

  test "should update timetable" do
    patch timetable_url(@timetable), params: { timetable: { SchoolClass_id: @timetable.SchoolClass_id, Subject_id: @timetable.Subject_id, Teacher_id: @timetable.Teacher_id, day: @timetable.day, end_time: @timetable.end_time, start_time: @timetable.start_time } }, as: :json
    assert_response :success
  end

  test "should destroy timetable" do
    assert_difference("Timetable.count", -1) do
      delete timetable_url(@timetable), as: :json
    end

    assert_response :no_content
  end
end
