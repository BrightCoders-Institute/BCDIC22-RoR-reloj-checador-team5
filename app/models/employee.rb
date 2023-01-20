class Employee < ApplicationRecord
	validates :employee, presence: true
	validates :email, presence: true
	validates :name, presence: true
	validates :position, presence: true
	validates :number_private, presence: true
	validates :is_employee, presence: false
	# self.primary_key = "employee"
	has_many :checks, foreign_key:"employee_id"
end
