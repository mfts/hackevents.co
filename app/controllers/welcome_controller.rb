class WelcomeController < ApplicationController

  layout "layouts/home"

  def index
    @result = request.location
    @hackathons = Hackathon.where('date_start >= ?', Time.zone.now).order(:date_start)
    @featured = Hackathon.where('date_start >= ? AND highlighted = ?', Time.zone.now, true).order(:date_start)
    @count = Hackathon.where('date_start >= ?', Time.now).count
    @cities = City.order(hackathon_count: :desc)
    @city_count = City.where('hackathon_count > 0').count
    @europe = Hackathon.find_in_region("Europe").order(:date_start)
    @germany = @hackathons.where(country: ["Germany","Deutschland"])
    @usa = @hackathons.where(country: ["USA"])
    @latest = Hackathon.where('date_start >= ?', Time.zone.now).order('created_at DESC').limit(10)
    @worldwide = Hackathon.find_in_except_region("Europe").order(:date_start)
  end
end