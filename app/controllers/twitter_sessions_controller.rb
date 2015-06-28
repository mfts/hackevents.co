class TwitterSessionsController < ApplicationController
  
  def create
    # credentials = request.env['omniauth.auth']['credentials']
    # session[:access_token] = credentials['token']
    # session[:access_token_secret] = credentials['secret']
    # redirect_to show_path, notice: 'Signed in'
    @user = TwitterAccount.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def show
    @user = TwitterAccount.find_by(id: session[:user_id])
  end

  def error
    flash[:error] = 'Sign in with Twitter failed'
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out'
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end


  private

  def user_params
    params.require(:twitter_user).permit(:provider, :uid, :name, :token, :secret, :profile_image)
  end
end
