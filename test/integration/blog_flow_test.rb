require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  class BlogFlowTest < ActionDispatch::IntegrationTest
    test "Main page loads" do
      get "/"
      assert_select "h1", "Новостной блог"
    end
    test "Posts exists" do
      get "/posts/1"
      assert_response :success
    end
  end
end
