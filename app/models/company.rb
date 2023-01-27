class Company < ApplicationRecord
	has_many :employees, foreign_key:"employee_id"
end
