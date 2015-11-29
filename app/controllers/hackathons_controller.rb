class HackathonsController < ApplicationController
  include ApplicationHelper
  before_action :set_hackathon, only: [:show, :edit, :update, :follow, :unfollow]
  before_action :require_user,  only: [:follow, :unfollow]
  before_action :require_organizer && :require_this_organizer, only: [:edit, :update]

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

  def edit
  end

  def update
    @hackathon.events.build
    respond_to do |format|
      if @hackathon.update(hackathon_params)
        format.html { redirect_to nice_hackathon_path(@hackathon), notice: 'Your hackathon has successfully been updated.' }
        format.json { render :show, status: :ok, location: @hackathon }
      else
        format.html { render :edit, error: 'Something is wrong. Please check for errors.' }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
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

  def require_this_organizer
    if current_user.organizing_hackathon?(@hackathon)
      true
    else
      flash[:notice] = "Contact us if you are the organizer of this hackathon."
    end
  end

  def set_hackathon
    # if params[:id].present?
    #   @hackathon = Hackathon.friendly.find(params[:id])
    # else
    #   @hackathon = Hackathon.find(params[:id] || params[:name].to_i)
    # end
    @hackathon = Hackathon.find(params[:id] || params[:name].to_i)
  end

  def hackathon_params
    params.require(:hackathon).permit(:title, :description, :country, :city_string, :city_id, :url, :date_start, :date_end, :venue, :address, :challenge, :sponsors, :awards, :schedule, :application, :application_deadline, :twitter_hashtag, :longitude, :latitude, :image_url, { :events_attributes => [:id, :name, :description, :datetime, :_destroy] }, { category_ids: [] }, { sponsor_ids: [] })
  end
end