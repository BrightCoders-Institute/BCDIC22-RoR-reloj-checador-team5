class Employee < ApplicationRecord
	validates :employee, presence: true
	validates :email, presence: true
	validates :name, presence: true
	validates :position, presence: true
	validates :number_private, presence: true
	validates :is_employee, presence: true
end
