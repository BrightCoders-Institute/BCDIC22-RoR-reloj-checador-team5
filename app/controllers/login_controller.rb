class LoginController < ApplicationController
  def index	
  end

  def create
    admin_params.each do |key, value|
      redirect_to admin_index_path if value == "admin"
    end
  end

  private
    def admin_params
      params.permit(:password)
    end
end
