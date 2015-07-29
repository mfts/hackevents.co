class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success

  private
  def logged_in?
    current_user
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
    # rescue ActiveRecord::RecordNotFound
  end
  helper_method :current_user

  def require_user
    if current_user
      true
    else
      redirect_to new_user_session_path, notice: "You must be logged in to access that page."
    end
  end 

  def require_admin
    if current_user && current_user.admin?
      true
    else
      redirect_to new_user_session_path, notice: "You must log in as admin user."
    end
  end

end

