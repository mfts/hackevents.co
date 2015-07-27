class TwitterAccountsController < ApplicationController
  before_action :require_user,  only: [:edit, :follow, :unfollow]

  def create
    if current_user
      current_user.twitter_account.find_or_create_from_auth_hash(auth_hash)
      flash[:notice] = "Authentication successful."
      redirect_to twitter_account_url
    else
      twitter_account = TwitterAccount.find_or_create_from_auth_hash(auth_hash)
      names        = twitter_account.name.split(" ")
      first_name   = names.first
      last_name    = names.size > 1 ? names.last : ""
      
      if twitter_account.user_id?
        @user = User.find_by(id: twitter_account.user_id)
      else
        @user = User.new(first_name: first_name, last_name: last_name)
        @user.twitter_account = twitter_account
      end
      @user.save
      
      cookies.signed[:user_id] = { value: @user.id, expires: 1.year.from_now }
      redirect_to root_path
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
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
    cookies.delete :user_id
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
