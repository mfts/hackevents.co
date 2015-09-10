class CitiesController < ApplicationController
  layout "layouts/city"

  def show
    name = params[:id].gsub("-"," ").split.map(&:capitalize).join(' ')
    id = City.find_by_name!(name)
    @city = City.find(id)
  end

end
