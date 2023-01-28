class Employee < ApplicationRecord
  belongs_to :company
  validates :employee, presence: true
	validates :email, presence: true
	validates :name, presence: true
	validates :position, presence: true
	validates :number_private, presence: true
	has_many :checks
end
