class ProfilesController < ApplicationController
  before_action :require_user,  only: [:follow, :unfollow]
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end

  # def location
  #   @user = current_user
  #   @hide_email_resend_box = true
  #   render '_location_form'
  # end

  # def interest
  #   @user = current_user
  #   @hide_email_resend_box = true
  #   if request.patch?
  #     respond_to do |format|
  #       if @user.update(user_params)
  #         format.html { render '_interest_form', notice: 'User was successfully updated.' }
  #         format.json { render :show, status: :ok, location: @user }
  #       else
  #         format.html { render :edit, error: 'Something is wrong.' }
  #         format.json { render json: @user.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   else
  #     render '_interest_form'
  #   end
  # end

  # def affiliation
  #   @user = current_user
  #   @hide_email_resend_box = true
  #   if request.patch?
  #     respond_to do |format|
  #       if @user.update(user_params)
  #         format.html { render '_affiliation_form', notice: 'User was successfully updated.' }
  #         format.json { render :show, status: :ok, location: @user }
  #       else
  #         format.html { render :edit, error: 'Something is wrong.' }
  #         format.json { render json: @user.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   else
  #     render '_affiliation_form'
  #   end
  # end

  # def email
  #   @user = current_user
  #   title = "Well done! =)"
  #   subtitle = "We will only notify you with hackathons that you are interested in."
  #   resend = false
  #   @hide_email_resend_box = true
  #   if request.patch?
  #     respond_to do |format|
  #       if @user.update(user_params)
  #         format.html { render '_email_form', locals: { title: title, subtitle: subtitle, resend: resend }, notice: 'User was successfully updated.' }
  #         format.json { render :show, status: :ok, location: @user }
  #       else
  #         format.html { render :edit, error: 'Something is wrong.' }
  #         format.json { render json: @user.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   else
  #     title = "Oops!"
  #     subtitle = "Please enter a valid email address, so that you never miss a hackathon."
  #     resend = true
  #     render '_email_form', locals: { title: title, subtitle: subtitle, resend: resend }
  #   end
  # end


  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to settings_profile_path, notice: 'Your profile has successfully been updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, error: 'Something is wrong.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    current_user.destroy
    reset_session
    cookies.delete :user_id
    redirect_to root_path, notice: 'Signed out'
  end

  def send_email_confirmation
    UserMailer.registration_confirmation(current_user).deliver
    redirect_to settings_profile_path, success: 'Your email confirmation has successfully been sent out.'
  end

  def resend_email_confirmation
    title = "Oops!"
    if current_user.email.present?
      UserMailer.registration_confirmation(current_user).deliver
      @hide_email_resend_box = true
      redirect_to :back, success: 'Your email confirmation has been sent out again.'
    else
      redirect_to settings_profile_path, error: "Please enter a valid email."
    end
  end

  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :twitter_name, :email, :password, :password_confirmation, :location, :radius, { category_ids: [] }, { sponsor_ids: [] })
  end
end