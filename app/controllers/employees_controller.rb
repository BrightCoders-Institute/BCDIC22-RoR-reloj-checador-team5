class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    employee
  end

  def new
    @employee = Employee.new
    @companies = Company.all
  end

  def create
    @company = Company.find_by(company_params)
    puts @company.id
    @employee = @company.employees.new(employee_params)
    puts "sussesfull"
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

    def company_params
      params.permit(:name)
    end

end
