class Employee < ApplicationRecord
	validates :employee, presence: true
	validates :email, presence: true
	validates :name, presence: true
	validates :position, presence: true
	validates :number_private, presence: true
	has_many :checks, foreign_key:"employee_id"
	belongs_to :company, foreign_key: "company_id"
end
