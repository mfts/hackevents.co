class WelcomeController < ApplicationController

  layout "layouts/home"

  def index
    @result = request.location
    @featured = Hackathon.where('date_start >= ? AND highlighted = ?', Time.zone.now, true)
    @count = Hackathon.where('date_start >= ?', Time.now).count
    @cities = City.order(hackathon_count: :desc)
    @city_count = City.count
  end
end