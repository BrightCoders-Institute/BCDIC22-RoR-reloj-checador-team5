require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  def setup
    login
  end
  test "should get comployees" do
    get employees_url
    assert_response :success
  end

  test "employee_create" do 
    post employees_path, params: { employee: {
        company_id: 1,
        email: 'eduard@html.com',
        name: 'eduard',
        position: 'gfe',
        employee: '1',
        number_private: '1'
      }
    }
    assert_redirected_to employees_path
  end
end
