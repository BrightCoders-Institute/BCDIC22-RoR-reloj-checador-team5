require "test_helper"

class ChecksControllerTest < ActionDispatch::IntegrationTest
  setup do 
    login #log in admin
  end


  test "should get checks" do
    get checks_url
    assert_response :success
  end

  test "checks_in" do 
    post checks_path, params: {
        employee_id: 1,
        number_private: '1',
        check: 'in'
      }
    assert_redirected_to '/'
    # assert_response :success
  end
end
