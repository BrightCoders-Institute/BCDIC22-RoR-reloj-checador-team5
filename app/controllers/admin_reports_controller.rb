class AdminReportsController < ApplicationController
  helper_method :show
  helper_method :attendace
  helper_method :average
  def index
    @checks= Check.all
  end

  def show
    attendace
  end

  private

  def employee_params
    params.permit(:employee, :number_private)
  end

  def check_params
    params.permit(:check)
  end

  def attendace
    count = Check.group_by_day(:datetime).where(check: 'in').count
    "#{Check.group_by_day(:datetime).where(check: 'in').count}"
    count
  end

  def absence
    count = Check.group_by_month(:datetime).where(check: 'off').count
    count
  end

  def average
    count = Check.group_by_month(:datetime).average(:employee_id)
    count
  end
end

