# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
# seed para crear empleados para las graficas

company_quantity = 5
employee_quantity = 10
checks_quantity = employee_quantity
checks_per_employee = 5


company_quantity.times do |i|
  Company.create(
    name: Faker::Company.unique.name,
    address: Faker::Address.full_address,
  )
end

company_quantity.times do |j|
  employee_quantity.times do |i|
    employee_number = Faker::Number.unique.number(digits: 3)
    Employee.create!(
      company_id: j,
      employee: employee_number,
      email: "#{Faker::Ancient.unique.god}@gmail.com",
      name: Faker::Name.unique.name,
      position: Faker::Job.position,
      number_private: Faker::Number.number(digits: 3),
      is_employee: Faker::Boolean.boolean(true_ratio: 0.8),
    )
  end
end

checks_per_employee.times do |j|
  checks_quantity.times do |i|
    date = Faker::Date.between(from: 2.month.ago, to: Date.today)
    Check.create(
      employee_id: i,
      datetime: date,
      check: 'in',
    )
    Check.create(
      employee_id: i,
      datetime: date,
      check: 'off',
    )
  end
end

