class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    Employee.create!(email: params['email'], name: params['name'], position: params['position'],
                     employee: params['employee'], number_private: params['number_private'])

    redirect_to action: :index
  end

  def edit
    @employee = Employee.find(params['id'])
  end

  def update
    employee = Employee.find(params['id'])
    employee.update(email: params['email'], name: params['name'], position: params['position'],
                    employee: params['employee'], number_private: params['number_private'])
    redirect_to action: :index
  end

  def destroy
    Employee.find(params['id']).destroy

    redirect_to action: :index
  end
end
