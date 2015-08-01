class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success
  before_action :setup_search
  
  private
  
  def setup_search
    q_param = nil
    
    if params[:q].present? && params[:q][:title_or_country_or_city_cont].present?
      q_param     = { title_or_country_or_city_cont: params[:q][:title_or_country_or_city_cont].titleize }
    end
    
    if q_param.blank? && params[:country].present? && params[:city].blank?
      q_param = { country_cont: params[:country].titleize }
    end
    
    if q_param.blank? && params[:country].present? && params[:city].present?
      q_param = { city_cont: "#{params[:city]}".titleize }
    end
    
    @page        = params[:page]
    @per_page    = params[:per_page]
    
    if params[:category]
      @q          = Category.find(params[:category]).hackathons.includes(:sponsors, :categories, { users: [:twitter_account] }).ransack q_param
    else
      @q          = Hackathon.includes(:sponsors, :categories, :users).ransack q_param
    end
    
    @q
  end
  
  def sidebar_visible?
    cookies.signed[:sidebar_visible].nil? ? true : cookies.signed[:sidebar_visible]
  end
  helper_method :sidebar_visible?
  
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
      redirect_to root_path, notice: "You must be logged in to access that page."
    end
  end 

  def require_admin
    if current_user && current_user.admin?
      true
    else
      redirect_to root_path, notice: "You must log in as admin user."
    end
  end

end

