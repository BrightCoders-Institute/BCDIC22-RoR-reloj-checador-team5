class AdminReportsController < ApplicationController
  helper_method :attendance, :average, :absence

  def index; end

  private

  def company
    param = params[:company_id].nil? ? 1 : params[:company_id]
    Company.find_by(id: param.to_i)
  end

  def attendance
    checks = Check.where(employee_id: company.employees.ids)
    checks.group_by_day(:datetime).where(check: 'in').count
  end

  def average
    checks = Check.where(employee_id: company.employees.ids)
    checks.group_by_month(:datetime).average(:employee_id)
  end

  def absence
    hash = Check.group_by_day(:datetime).where(employee_id: company.employees.ids, check: 'in').count
    result = {}
    final_hash = {}
    hash.each do | key, value |
      absence = 0
      numEmployees = company.employees.count
      absence = numEmployees - value
      result[key] = absence
    end
    result
  end
end

