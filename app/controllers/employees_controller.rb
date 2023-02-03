class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    employee
  end

  def new
    @employee = Employee.new
    @companies = Company.select(:name, :id)
  end

  def create
    @company = Company.find_by(company_params)
    @employee = @company.employees.new(employee_params.merge(:is_employee => true))
    if @employee.save
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    employee
  end

  def update
    if employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    employee.is_employee = false
    employee.save
    redirect_to employees_path
  end

  private
    def employee_params
      params.require(:employee).permit(:email, :name, :position, :employee, :number_private) 
    end

    def employee
      @employee = Employee.find(params[:id])
    end

    def company_params
      params.permit(:name, :id)
    end

end
