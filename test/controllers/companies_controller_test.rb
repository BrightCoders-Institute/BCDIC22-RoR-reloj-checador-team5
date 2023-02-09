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
  end

  test 'allow to update a company' do
    patch company_path(companies(:one)), params: {
        company: {
            name: 'amazon'
        }
    }
    assert_redirected_to companies_path
  end

  test 'can deleate products' do
    assert_difference('Company.count', -1) do
        delete company_path(companies(:one))
    end
    assert_redirected_to companies_path
  end
end
