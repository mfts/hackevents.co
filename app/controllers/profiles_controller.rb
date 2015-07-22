class ProfilesController < ApplicationController
  before_action :require_user,  only: [:follow, :unfollow]
  
  def show
    @user = current_user
    @friendsList = @user.twitter_account.getFriends
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    current_user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  
  private
  
  def user_params
    if params[:name]
      params.require(:twitter_account).permit(:name, :description, :profile_image)
    else
      params.require(:user).permit(:first_name, :last_name, :twitter_name, :email, :password, :password_confirmation)
    end
  end
end