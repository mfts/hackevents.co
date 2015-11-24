class PagesController < ApplicationController
  def imprint
  end

  def home
  end

  def frontpage
  end

  def aboutpage
    @team = User.where(team: true)
    @supporters = User.where(support: true)
  end

  def jobs
  end

  def europe
    @hackathons = Hackathon.find_in_region("Europe").order(:date_start)
    respond_to do |format|
      format.html {render :layout => 'layouts/city'}
    end
  end
end