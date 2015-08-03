module Admin
  class SponsorsController < BaseController
    def index
      @sponsors = Sponsor.order(:twitter_handle)
    end
    
    def destroy
      @sponsor = Sponsor.find(params[:id]).destroy
      redirect_to admin_sponsors_path
    end
    
    def new
      @sponsor = Sponsor.new
    end
    
    def create
      @sponsor = Sponsor.new(sponsor_params)
      if @sponsor.save
        redirect_to admin_sponsors_path
      else
        render :new
      end
    end
    
    def edit
      @sponsor = Sponsor.find(params[:id])
    end
    
    def update
      @sponsor = Sponsor.find(params[:id])
      if @sponsor.update(sponsor_params)
        redirect_to admin_sponsors_path
      else
        render :edit
      end
    end
    
    private
    
    def sponsor_params
      params[:sponsor].permit(:twitter_handle, :twitter_image_url, :twitter_name, :alt_name)
    end
  end
end