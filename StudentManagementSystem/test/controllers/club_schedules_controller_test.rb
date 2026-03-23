require "test_helper"

class ClubSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club_schedule = club_schedules(:one)
  end

  test "should get index" do
    get club_schedules_url, as: :json
    assert_response :success
  end

  test "should create club_schedule" do
    assert_difference("ClubSchedule.count") do
      post club_schedules_url, params: { club_schedule: { Club_id: @club_schedule.Club_id, Location_id: @club_schedule.Location_id, activity_type: @club_schedule.activity_type, end_time: @club_schedule.end_time, schedule_date: @club_schedule.schedule_date, start_time: @club_schedule.start_time } }, as: :json
    end

    assert_response :created
  end

  test "should show club_schedule" do
    get club_schedule_url(@club_schedule), as: :json
    assert_response :success
  end

  test "should update club_schedule" do
    patch club_schedule_url(@club_schedule), params: { club_schedule: { Club_id: @club_schedule.Club_id, Location_id: @club_schedule.Location_id, activity_type: @club_schedule.activity_type, end_time: @club_schedule.end_time, schedule_date: @club_schedule.schedule_date, start_time: @club_schedule.start_time } }, as: :json
    assert_response :success
  end

  test "should destroy club_schedule" do
    assert_difference("ClubSchedule.count", -1) do
      delete club_schedule_url(@club_schedule), as: :json
    end

    assert_response :no_content
  end
end
