# frozen_string_literal: true

# Controller for validating the check
class ChecksController < ApplicationController
  def index
    nil
  end

  def create
    @employee = Employee.where(employee: params['employee'], number_private: params['number_private'])
    if @employee
      puts 'aver'
    else
      puts 'mamo'
    end
  end
end
