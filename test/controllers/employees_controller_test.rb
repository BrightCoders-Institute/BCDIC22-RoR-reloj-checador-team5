require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  def setup
    login
  end
  # test 'should get index' do
  #   get employees_path
  #   assert_response :success
  # end

  # test 'render a new employee form' do 
  #   get new_employee_path

  #   assert_response :success
  #   assert_select 'form'
  # end

  # test 'create new employee' do
  #   post new_employee_path, params: {
  #     email: 'manu@',
  #     name: 'MyString',
  #     position: 'MyString',
  #     employee: 'MyString',
  #     number_private: '619'
  #   }

  #   assert_redirected_to employees_path
  # end

  # test 'allow to update a employee' do
  #   patch employee_path(employees(:one)), params: {
  #     employee: {
  #     name: 'averg'
  #     }
  #   }

  #   assert_redirected_to employees_path
  # end

  # test 'can delete employee' do
  #   assert_difference('Employee.count', -1) do
  #       delete employee_path(employees(:one))
  #   end

  #   assert_redirected_to employees_path
  # end
end
