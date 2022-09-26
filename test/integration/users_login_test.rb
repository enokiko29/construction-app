require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  # def setup
  #   @user = User.new(name: "ExampleUser", email: "user@example.com", 
  #                     password: "foobar", password_confirmation: "foobar")
  # end

  def setup
    @user = users(:exampleuser)
  end

 
  

  test "login with valid email/invalid password" do
    get new_user_session_path
    assert_template 'sessions/new'
    post new_user_session_path, params: { session: { name: 'ExampleUser',
                                          encrypted_password: "invalid" } }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  # test "login with valid information followed by logout" do
  #   get new_user_session_path
  #   post new_user_session_path, params: { session: { name: 'ExampleUser',
  #                                         encrypted_password: 'foobar' } }
  #   # assert is_logged_in?
  #   # assert_redirected_to @user
  #   # follow_redirect!
  #   # assert_template 'users/show'
  #   assert_select "link_to", new_user_session_path, count: 0
  #   assert_select "link_to", destroy_user_session_path
  #   assert_select "link_to", user_path(@user)
  #   delete destroy_user_session_path
  #   assert_not is_logged_in?
  #   assert_redirected_to root_url
  #   follow_redirect!
  #   assert_select "link_to", new_user_session_path
  #   assert_select "link_to", destroy_user_session_path,      count: 0
  #   assert_select "link_to", user_path(@user), count: 0
  # end
end