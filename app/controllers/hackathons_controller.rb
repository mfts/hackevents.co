class HackathonsController < ApplicationController
  before_action :set_hackathon, only: [:show, :follow, :unfollow]
  before_action :require_user,  only: [:follow, :unfollow]
  
  def index
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
    
    page        = params[:page]
    per_page    = params[:per_page]
    @q          = Hackathon.ransack q_param
    @hackathons = @q.result.where('date_start >= ?', Time.zone.now).order(date_start: :asc).page(page).per(per_page)
    
    if current_user
      @membership_hackathon_ids = Membership.where(user_id: current_user.id, hackathon_id: @hackathons.map{ |h| h.id }).map{ |m| m.hackathon_id }
    end
  end

  def show

  end


  def follow
    current_user.follow_hackathon(@hackathon)
    redirect_to :back
  end

  def unfollow
    current_user.unfollow_hackathon(@hackathon)
    redirect_to :back
  end
  
  private

  def set_hackathon
    if params[:id].present?
      @hackathon = Hackathon.friendly.find(params[:id])
    else
      @hackathon = Hackathon.find(params[:id] || params[:name].to_i)
    end
  end
end


