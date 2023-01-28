# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
# seed para crear empleados para las graficas
10.times do |i|

  employee_number = Faker::Number.unique.number(digits: 3)
  Employee.create!(
    employee: employee_number,
    email: "#{Faker::Ancient.god}@gmail.com",
    name: Faker::Name.unique.name,
    position: Faker::Job.position,
    number_private: Faker::Number.number(digits: 3),
    is_employee: Faker::Boolean.boolean(true_ratio: 0.8),
  )
end

5.times do |j|
  10.times do |i|
    value = Faker::Boolean.boolean(true_ratio: 0.5)
    Check.create(
      employee_id: i,
      datetime: Faker::Date.between(from: 4.month.ago, to: Date.today),
      check: value == true ? 'in' : 'off',
    )
  end
end

10.times do |i|
  Company.create(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
  )
end