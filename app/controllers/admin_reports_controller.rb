class AdminReportsController < ApplicationController
  helper_method :attendance
  helper_method :average
  helper_method :absence
  # helper_method :options

  def index
    @companies = Company.all
  end

  def create
    report_params.each do | key, report |
      attendance if report == "attendance"
      avarage if report == "avarage"
      absence if report== "absence"

      # redirect_back(fallback_location: admin_reports_path(company_params))
    end
  end

  private

  def options
    sql = 'select id, name from companies order by name'
    records_array = ActiveRecord::Base.connection.execute(sql)
    records_array.each do | id, name |
      name
    end
  end

  def company_params
    params.permit(:name)
  end

  def report_params
    params.permit(:report)
  end

  def attendance
    @company = Company.find_by(company_params)
    checks = Check.where(id: @company.employees.ids)
    checks.group_by_day(:datetime).where(check: 'in').count
    # @company.employees.ids
    # sql = "select *  from checks 
    #   where employee_id in (#{@company.employees.ids.join(",")})" 
    #   #TO_CHAR(DATE(datetime), 'Month') as Month, count(*) | and checks.check = 'in' group by Month"
    # checks = ActiveRecord::Base.connection.execute(sql)


    # checks = Check.find_by_sql("select * from checks where employee_id in (#{@company.employees.ids.join(",")})").to_a


    # records_array.each do |mes, suma|
    #   puts "#{mes} #{suma}"
    # end

    # puts Check.group_by_month(:datetime).average(:employee_id)
    #.group_by_day(:datetime).where(check: 'in').count
  end

  def average
    @company = Company.find_by(company_params)
    checks = Check.where(id: @company.employees.ids)
    checks.group_by_month(:datetime).average(:employee_id)
  end

  def absence
    # sql = "select employee_id, datetime from checks where checks.check = 'in' group by employee_id, datetime"
    # records_array = ActiveRecord::Base.connection.execute(sql)
    # hash = Check.group_by_day(:datetime).where(check: 'in').count

    # result = {}
    # final_hash = {}
    # hash.each do | key, value |
    #   absence = 0
    #   numEmployees = @employee.size
    #   absence = numEmployees - value
    #   result[key] = absence
    # end
    
    # result
  end

end

