class CitiesController < ApplicationController
  layout "layouts/city"

  def show
    id = City.find_by_name!(params[:id].capitalize)
    @city = City.find(id)
  end

end
