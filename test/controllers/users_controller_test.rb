require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get ensure_normal_user" do
    get new_user_session_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to root_path
  end
end