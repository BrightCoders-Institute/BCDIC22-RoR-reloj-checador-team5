class Authentication::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end
  private

  para que
  def user_params

  end 

end