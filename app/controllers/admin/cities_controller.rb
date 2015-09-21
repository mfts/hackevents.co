module Admin
  class CitiesController < BaseController
    def index
      @cities = City.order(:name)
    end

    def new
      @city = City.new
    end

    def edit
      id = City.find_by_name!(name)
      @city = City.find(id)
    end

    def update
      name = params[:id].gsub("-"," ").split.map(&:capitalize).join(' ')
      id = City.find_by_name!(name)
      @city = City.find(id)
      if @city.update(city_params)
        redirect_to admin_cities_path
      else
        render :edit
      end
    end

    private
    
    def city_params
      params[:city].permit(:name, :image_url, :source_url, :source_name)
    end
  end
end
