module Admin
  class CitiesController < BaseController
    before_action :set_city, only: [:edit, :update]

    def index
      @cities = City.order(:name)
    end

    def new
      @city = City.new
    end

    def edit
    end

    def update
      # name = params[:id].gsub("-"," ").split.map(&:capitalize).join(' ')
      # @city = City.find_by_name!(name)
      if @city.update(city_params)
        redirect_to admin_cities_path
      else
        render :edit
      end
    end

    private
    
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params[:city].permit(:name, :image_url, :source_url, :source_name)
    end
  end
end
