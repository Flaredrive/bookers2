class ApplicationController < ActionController::Base
  include Authentication
  #include ActionController::Cookies
  #include ActionController::RequestForgeryProtection
  #protect_from_forgery with: :exception
  allow_browser versions: :modern

  #before_action :set_current_user
  #before_action :require_login

  def set_current_user
    Current.user = User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to new_session_path, alert: "Please log in" unless Current.user
  end

  private

  def after_authentication_url
    homes_about_path
  end

  def after_logout_url
    homes_about_path
  end
end