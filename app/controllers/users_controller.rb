class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers, :hackathons]

  # GET /users/new
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  # POST /users
  # POST /users.json
  def create
    if auth_hash
      @user = TwitterAccount.find_or_create_from_auth_hash(auth_hash)
      redirect_to root_path
    else
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          UserMailer.registration_confirmation(@user).deliver
          format.html { redirect_to root_url, notice: 'Please confirm your email to continue.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def confirm_email
    user = User.find_by(confirm_token: params[:id])
    respond_to do |format|
      if user
        user.email_activate
        cookies[:user_id] = user.id
        format.html { redirect_to login_url, success: "Welcome to the Hackevents! Your email has been confirmed.
                                                      Please sign in to continue." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to root_url , error: "Sorry. User does not exist." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def following
    @active = "following"
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @active = "followers"
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def hackathons
    @active = "hackathons"
    @title = "Favorite Hackathons"
    @user = User.find(params[:id])
    @hackathons = @user.hackathons
    render 'show_hackathon'
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id]) #|| TwitterAccount.find(params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :twitter_name, :email, :password, :password_confirmation)
    end

  protected

    def auth_hash
      request.env['omniauth.auth']
    end
end