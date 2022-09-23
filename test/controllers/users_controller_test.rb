require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get ensure_normal_user" do
    get new_user_session_path
    assert_response :success
  end
end