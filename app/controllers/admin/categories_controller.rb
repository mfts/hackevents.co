module Admin
  class CategoriesController < BaseController
    def index
      @categories = Category.order(:name)
    end
    
    def destroy
      @category = Category.find(params[:id]).destroy
      redirect_to admin_categories_path
    end
    
    def edit
      @category = Category.find(params[:id])
    end
    
    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to admin_categories_path
      else
        render :edit
      end
    end
    
    private
    
    def category_params
      params[:category].permit(:name, :primary_hex_color)
    end
  end
end