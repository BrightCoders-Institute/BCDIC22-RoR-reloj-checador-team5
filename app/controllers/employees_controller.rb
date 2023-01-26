class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    employee
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to checks_path
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
    employee.destroy
    redirect_to employees_path
  end

  private
    def employee_params
      params.require(:employee).permit(:email, :name, :position, :employee, :number_private)
    end

    def employee
      @employee = Employee.find(params[:id])
    end

end
