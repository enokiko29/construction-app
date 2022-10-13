require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with valid name/invalid password" do
    get new_user_session_path
    assert_template 'sessions/new'
    post user_session_path, params: { session: { name: 'MichaelExample',
                                      encrypted_password: "invalidpass1word" } }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end