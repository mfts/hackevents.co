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
end