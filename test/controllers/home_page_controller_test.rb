require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "have main page" do
    get root_path
    assert_response :success
  end
  test "have header" do
    get root_path
    assert_response :success
    assert_template 'home_page/index'
    assert_select "h1", "Новостной блог"
  end
end
