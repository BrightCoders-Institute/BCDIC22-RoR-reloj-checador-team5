# frozen_string_literal: true

# Controller for validating the check
class ChecksController < ApplicationController
  def index
    nil
  end

  def create
    check = Employee.find_by(check_params)
    check.nil? ? flash[:notice] = 'Successfully check' : flash[:alert] = 'User no avalible'

    redirect_back(fallback_location: root_path)
  end

  private

  def check_params
    params.permit(:employee, :number_private)
  end
end
