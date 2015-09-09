class CitiesController < ApplicationController
  layout "layouts/city"

  def show
    @city = City.find(params[:id])
  end

end
