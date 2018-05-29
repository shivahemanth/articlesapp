class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :check_login
  before_action :show_flash

  

  private

  def show_flash
    flash.now[:notice] = "Found the about page!" if request.path == '/pages/about'
  end

  def check_login
  	unless logged_in?
  		redirect_to login_path
  	end	
  end	

  def logged_in?
    !current_user.nil?
  end
end
