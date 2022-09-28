require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  # def setup
  #   @user = User.new(name: "ExampleUser", email: "user@example.com", 
  #                     password: "foobar", password_confirmation: "foobar")
  # end

  def setup
    @user = users(:michael)
  end

  # def setup
  #   @user = users( :michael )
  #   sign_in(@user)
  # end
  

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

  # test "login with valid information followed by logout" do
  #   get new_user_session_path
  #   post user_session_path, params: { session: { name: 'MichaelExample',
  #                                         password: "pass1word"} }
  #   assert is_logged_in?
  #   assert_redirected_to @user
  #   follow_redirect!
  #   assert_template 'sessions/new'
  #   assert_template 'show'
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