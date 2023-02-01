class Authentication::SessionsController < ApplicationController
  skip_before_action :protect_pages

  def new; end

  def create
    @admin = {user: 'admin', password: params[:password]}
    if @admin[:password] == "admin"
      session[:admin] = @admin
      redirect_to admin_index_path 
    else 
      flash[:alert] = 'Wrong password'
      redirect_back(fallback_location: new_session_path)
    end
  end
end

