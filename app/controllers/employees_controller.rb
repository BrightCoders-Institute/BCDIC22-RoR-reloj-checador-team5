class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
  end

  def create
    Employee.create!(email: params['email'], name: params['name'], position: params['position'],
    employee: params['employee'], private:['private'])

    redirect_to action: :index
  end
end
