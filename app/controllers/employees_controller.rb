class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    @companies = Company.all
  end

  def show
    employee
  end

  def new
    @employee = Employee.new
    @companies = Company.select(:name, :id)
  end

  def create
    unless company.nil?
      @employee = company.employees.new(employee_params.merge(:is_employee => true))
    else
      @employee = Employee.new(employee_params.merge(:is_employee => false))
    end

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
    if employee.update(employee_params.merge(:is_employee => true))
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @worker = Employee.find(params[:id])
    if @worker.is_employee == true
      @worker.update(is_employee: false)
    else
      @worker.update(is_employee: true)
    end
    redirect_to users_path
  end

  private
    def employee_params
      params.require(:employee).permit(:email, :name, :position, :employee, :number_private, :is_employee)
    end

    def employee
      @employee = Employee.find(params[:id])
    end

    def company
      @company = Company.find_by(params[:company_id])
    end
end
