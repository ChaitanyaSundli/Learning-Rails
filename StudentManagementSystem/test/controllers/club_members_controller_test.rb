require "test_helper"

class ClubMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club_member = club_members(:one)
  end

  test "should get index" do
    get club_members_url, as: :json
    assert_response :success
  end

  test "should create club_member" do
    assert_difference("ClubMember.count") do
      post club_members_url, params: { club_member: { Club_id: @club_member.Club_id, Student_id: @club_member.Student_id, role: @club_member.role, status: @club_member.status } }, as: :json
    end

    assert_response :created
  end

  test "should show club_member" do
    get club_member_url(@club_member), as: :json
    assert_response :success
  end

  test "should update club_member" do
    patch club_member_url(@club_member), params: { club_member: { Club_id: @club_member.Club_id, Student_id: @club_member.Student_id, role: @club_member.role, status: @club_member.status } }, as: :json
    assert_response :success
  end

  test "should destroy club_member" do
    assert_difference("ClubMember.count", -1) do
      delete club_member_url(@club_member), as: :json
    end

    assert_response :no_content
  end
end
