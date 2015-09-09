class HackathonsController < ApplicationController
  before_action :set_hackathon, only: [:show, :follow, :unfollow]
  before_action :require_user,  only: [:follow, :unfollow]

  layout "layouts/application"
  
  def index
    if params[:style] == "calendar"
      starter = Time.zone.now.beginning_of_week.to_date
      ender   = (Time.zone.now + 2.months).end_of_week.to_date
      @hackathons = Hackathon.where('date_start >= ?', starter).where('date_end <= ?', ender).order(date_start: :asc)
    else
      @hackathons = @q.result.where('date_start >= ?', Time.zone.now).order(date_start: :asc).page(@page).per(@per_page)
    end

    @result = request.location
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
  
  def show_sidebar
    cookies.signed[:sidebar_visible] = { value: true, expires: 1.year.from_now }
    render nothing: true
  end
  
  def hide_sidebar
    cookies.signed[:sidebar_visible] = { value: false, expires: 1.year.from_now }
    render nothing: true
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


