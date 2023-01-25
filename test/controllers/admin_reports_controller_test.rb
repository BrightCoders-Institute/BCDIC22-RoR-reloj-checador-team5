require "test_helper"

class AdminReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_reports_index_url
    assert_response :success
  end
end
