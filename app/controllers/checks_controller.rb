# frozen_string_literal: true

# Controller for validating the check
class ChecksController < ApplicationController
  def index
    nil
  end

  def create
    @employee = Employee.find_by(employee_params)
    if @employee != nil
      @check = @employee.checks.new(check_params.merge(:datetime => Time.now.strftime("%H:%M - %F")))
      @check.save ? flash[:notice] = 'Successfully check' : flash[:alert] = 'Checking faill'
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
    params.permit(:check)
  end
end
