class AdminReportsController < ApplicationController
  helper_method :show
  helper_method :attendace
  helper_method :average
  helper_method :absence
  helper_method :options
  def index
    @checks= Check.all
    @companies= Company.all

    absence
  end
  
  def show
    attendace
    average
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
    count = Check.group_by_day(:datetime).where(check: 'in').count
    "#{Check.group_by_day(:datetime).where(check: 'in').count}"
    count
  end

  def average
    count = Check.group_by_month(:datetime).average(:employee_id)
    count
  end

  def absence
    sql = "select employee_id, TO_CHAR(DATE(datetime), 'Month') as mes, datetime from checks
            where checks.check = 'in' and EXTRACT(MONTH FROM datetime) = 12
            group by employee_id, datetime"
    records_array = ActiveRecord::Base.connection.execute(sql)

    records_array.each do | date |
      date
    end
  end

end

