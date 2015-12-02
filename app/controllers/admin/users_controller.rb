module Admin
  class UsersController < BaseController
    before_action :set_user, only: [:edit, :update]

    def index
      @users = User.all
    end
    
    def edit
    end
    
    def update
      if @user.update(user_params)
        redirect_to admin_users_path
      else
        render :edit
      end
    end
  

    private

    def set_user
      @user = TwitterAccount.find_by_username(params[:id]).user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :twitter_name, :email, :password, :password_confirmation, :location, :radius, :team, :support, :organizer, { category_ids: [] }, { sponsor_ids: [] })
    end
  end
end