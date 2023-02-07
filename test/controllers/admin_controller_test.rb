require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do 
    login #log in admin
  end

  test "should get index" do
    get admin_index_url
    assert_response :success
  end
end
