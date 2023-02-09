require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  def setup
    login
  end
  test "should get companies" do
    get companies_url
    assert_response :success
  end
  test "companies_create" do 
    post companies_path, params: { company: {
        name: 'google',
        address: 'colima'
      }
    }
    assert_redirected_to companies_path
    # assert_response :success
  end
end
