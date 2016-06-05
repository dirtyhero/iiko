class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :pre_process, except: :destroy

  private
  def pre_process
    return if params[:controller] == "sessions"
    redirect_to login_path unless logged_in?
  end
end
