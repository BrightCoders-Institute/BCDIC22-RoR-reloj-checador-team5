require "test_helper"

class AdminReportsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    login #log in admin
  end

  test "should get reports" do
    get admin_reports_url
    assert_response :success
  end
end

