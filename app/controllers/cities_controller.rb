class CitiesController < ApplicationController
  layout "_default_main"
  def show
    @city = City.find(params[:id])
  end

end
