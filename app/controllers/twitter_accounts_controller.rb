class TwitterAccountsController < ApplicationController
  before_action :require_user,  only: [:edit, :follow, :unfollow]

  def create
    # credentials = request.env['omniauth.auth']['credentials']
    # session[:access_token] = credentials['token']
    # session[:access_token_secret] = credentials['secret']
    # redirect_to show_path, notice: 'Signed in'
    @user = TwitterAccount.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to twitter_account_path(@user)
  end

  def show
    @user = TwitterAccount.find_by(id: session[:user_id])
  end

  def edit
    @user = TwitterAccount.find_by(id: session[:user_id])
  end

  def update
    @user = TwitterAccount.find_by(id: session[:user_id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to twitter_account_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:twitter_account).permit(:name, :description, :profile_image)
  end
end
