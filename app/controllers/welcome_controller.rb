class WelcomeController < ApplicationController

  layout "layouts/home"

  def index
    @hackathons = @q.result.where('date_start >= ?', Time.zone.now).order(date_start: :asc).page(@page).per(@per_page)
    @featured = @hackathons.where('date_start >= ? AND highlighted = ?', Time.zone.now, true)
    @count = Hackathon.where('date_start >= ?', Time.now).count
    @result = request.location
  end
end