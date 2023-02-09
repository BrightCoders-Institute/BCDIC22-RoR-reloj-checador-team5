require "test_helper"

class Authentication::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login session" do
    get new_session_url
    assert_response :success
  end

  test "should login admin user by password" do
    post sessions_url, params: {password: 'admin'}
    assert_redirected_to admin_index_url
  end
end

