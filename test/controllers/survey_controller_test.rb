require 'test_helper'

class SurveyControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get survey_new_url
    assert_response :success
  end

  test "should get edit" do
    get survey_edit_url
    assert_response :success
  end

  test "should get create" do
    get survey_create_url
    assert_response :success
  end

  test "should get show" do
    get survey_show_url
    assert_response :success
  end

  test "should get info" do
    get survey_info_url
    assert_response :success
  end

  test "should get destroy" do
    get survey_destroy_url
    assert_response :success
  end

end
