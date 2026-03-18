require "test_helper"

class SchoolClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_class = school_classes(:one)
  end

  test "should get index" do
    get school_classes_url, as: :json
    assert_response :success
  end

  test "should create school_class" do
    assert_difference("SchoolClass.count") do
      post school_classes_url, params: { school_class: { grade_lvl: @school_class.grade_lvl, location_id: @school_class.location_id, section: @school_class.section } }, as: :json
    end

    assert_response :created
  end

  test "should show school_class" do
    get school_class_url(@school_class), as: :json
    assert_response :success
  end

  test "should update school_class" do
    patch school_class_url(@school_class), params: { school_class: { grade_lvl: @school_class.grade_lvl, location_id: @school_class.location_id, section: @school_class.section } }, as: :json
    assert_response :success
  end

  test "should destroy school_class" do
    assert_difference("SchoolClass.count", -1) do
      delete school_class_url(@school_class), as: :json
    end

    assert_response :no_content
  end
end
