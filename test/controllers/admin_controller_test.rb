require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do 
    login #log in admin
  end

  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get login" do
    get admin_login_url
    assert_response :success
  end
end
