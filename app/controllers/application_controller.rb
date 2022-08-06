class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end

  def after_sign_in_path_for(_resource)
    groups_path
  end

  private

  def remember_page
    session[:previous_pages] ||= []
    session[:previous_pages] << url_for(params.to_unsafe_h) if request.get?
    session[:previous_pages] = session[:previous_pages].uniq.first(2)
  end
end
