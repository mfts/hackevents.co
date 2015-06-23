class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) && user.email_confirmed
      session[:user_id] = user.id
      if user[:email].end_with?("hackevents.co")
        session[:admin_status] = true
      else
        session[:admin_status] = false
      end
      flash[:success] = "Thanks for logging in!"
      redirect_to hackathons_path
    else
      flash.now[:error] = 'Please activate your account by following the 
      instructions in the account confirmation email you received to proceed'
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:admin_status] = false
    reset_session
    redirect_to root_path, notice: "You have been logged out."
  end

end
