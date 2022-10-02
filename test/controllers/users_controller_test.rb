require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get ensure_normal_user" do
    get new_user_session_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to root_path
  end

  test "should redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to root_url
  end

  test "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to root_url
  end
end