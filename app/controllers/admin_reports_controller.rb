class AdminReportsController < ApplicationController
  helper_method :attendace
  helper_method :average
  helper_method :absence
  helper_method :options
  def index
    @checks = Check.all
    @companies = Company.all
  end

  private

  def options
    sql = 'select name from companies order by name'
    records_array = ActiveRecord::Base.connection.execute(sql)
    records_array.each do | name |
      name
    end

  end

  def employee_params
    params.permit(:employee, :number_private)
  end

  def check_params
    params.permit(:check)
  end

  def attendace
    Check.group_by_day(:datetime).where(check: 'in').count
  end

  def average
    Check.group_by_month(:datetime).average(:employee_id)
  end

  def absence
    # sql = "select employee_id, datetime from checks where checks.check = 'in' group by employee_id, datetime"
    # records_array = ActiveRecord::Base.connection.execute(sql)
    hm = Check.select(:datetime).where(check: 'in', check: 'off').count
  end

end

