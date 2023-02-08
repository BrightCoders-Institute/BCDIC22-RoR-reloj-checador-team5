class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    company
  end

  def update
    if company.update(company_params)
      redirect_to companies_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    disconect_employees

    company.destroy
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :address)
  end

  def company
    @company = Company.find(params[:id])
  end

  def disconect_employees
    company.employees.update(company_id: nil, is_employee: false)
  end
end
