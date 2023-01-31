class AdminReportsController < ApplicationController
  helper_method :attendance
  helper_method :average
  helper_method :absence
  # helper_method :options

  def index 
    @companies = Company.all
  end

  def create
    @companies = Company.all
    render :index
  end

  private

  def options
    sql = 'select id, name from companies order by name'
    records_array = ActiveRecord::Base.connection.execute(sql)
    records_array.each do | id, name |
      name
    end
  end

  def company
    Company.find_by(name: params[:name])
  end

  def attendance
    
    if company != nil
      checks = Check.where(employee_id: company.employees.ids)
      checks.group_by_day(:datetime).where(check: 'in').count
    end
  end

  def average
    if company != nil
      checks = Check.where(employee_id: company.employees.ids)
      checks.group_by_month(:datetime).average(:employee_id)
    end
  end

  def absence
    if company != nil
      hash = Check.group_by_day(:datetime).where(employee_id: company.employees.ids, check: 'in').count

      result = {}
      final_hash = {}
      hash.each do | key, value |
        absence = 0
        numEmployees = @company.employees.count
        absence = numEmployees - value
        result[key] = absence
      end
      result
    end
  end
end

