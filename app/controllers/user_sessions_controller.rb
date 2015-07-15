class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) && user.email_confirmed
      cookies[:user_id] = user.id
      flash[:success] = "Thanks for logging in!"
      redirect_to hackathons_path
    else
      flash.now[:alert] = 'Please activate your account by following the 
      instructions in the account confirmation email you received to proceed'
      render action: 'new'
    end
  end

  def destroy
    reset_session
    cookies.delete :user_id
    redirect_to root_path, notice: "You have been logged out."
  end

end
