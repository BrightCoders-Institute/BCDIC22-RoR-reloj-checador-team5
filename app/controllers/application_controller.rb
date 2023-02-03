class ApplicationController < ActionController::Base
  before_action :set_current_admin, :protect_pages

  private

  def set_current_admin
    Current.admin = session[:admin]
  end

  def protect_pages
    redirect_to new_session_path unless Current.admin
  end
end

