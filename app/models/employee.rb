class Employee < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true
    validates :position, presence: true
    validates :employee, presence: true
    validates :number_private, presence: true
end
