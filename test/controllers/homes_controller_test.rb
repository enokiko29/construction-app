require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Construction App"
  end

  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "index | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "about | #{@base_title}"
  end
end
