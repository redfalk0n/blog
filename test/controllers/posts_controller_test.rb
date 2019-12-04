require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should have header" do
    get post_url(@post)
    assert_select "h1", "test header"
  end

end
