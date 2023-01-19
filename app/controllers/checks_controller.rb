# frozen_string_literal: true

# Controller for validating the check
class ChecksController < ApplicationController
  def index
    nil
  end

  def create
    @employee = Employee.find_by(employee_params)
    puts @employee.name
    if @employee != nil
      @check = Check.new(check_params)
      @check.save ? flash[:notice] = 'Successfully check' : flash[:alert] = 'Checking fail'
    else
      flash[:alert] = 'Wrong number or password'
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def employee_params
    params.permit(:employee, :number_private)
  end

  def check_params
    params.require(:check).permit(:employee, :datetime, :check)
  end
end
