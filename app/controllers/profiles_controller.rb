class ProfilesController < ApplicationController
  before_action :require_user,  only: [:follow, :unfollow, :after_signup]
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end

  def after_signup
    @user = current_user
    render '_after_signup_form'
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.email_confirmed?
        if @user.update(user_params)
          format.html { redirect_to profile_path, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        if @user.update(user_params)
          UserMailer.registration_confirmation(@user).deliver
          format.html { redirect_to root_path, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :after_signup }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  
  def destroy
    current_user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :twitter_name, :email, :password, :password_confirmation)
  end
end