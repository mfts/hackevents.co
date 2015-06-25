class HackathonsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :upload, :export, :edit, :destroy]
  before_action :require_user,  only: [:follow, :unfollow]
  before_action :set_hackathon, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
  
  def index
    q_param     = params[:q]
    page        = params[:page]
    per_page    = params[:per_page]
    @q          = Hackathon.ransack q_param
    @hackathons = @q.result.where('date_start >= ?', Time.zone.now).order(date_start: :asc).page(page).per(per_page)
    
    if current_user
      @membership_hackathon_ids = Membership.where(user_id: current_user.id, hackathon_id: @hackathons.map{ |h| h.id }).map{ |m| m.hackathon_id }
    end
  end

  # GET /hackathons/1
  # GET /hackathons/1.json
  # def show
  # end

  # GET /hackathons/new
  def new
    @hackathon = Hackathon.new
  end

  # GET /hackathons/1/edit
  def edit
  end


  # POST /hackathons
  # POST /hackathons.json
  def create
    @hackathon = Hackathon.new(hackathon_params)

    respond_to do |format|
      if @hackathon.save
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully created.' }
        format.json { render :show, status: :created, location: @hackathon }
      else
        format.html { render :new }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end


  def import
    csv_file = params[:file].read
    CSV.parse(csv_file, headers:true) do |row|
      ques = Hackathon.create(title: row[0].force_encoding(Encoding::UTF_8),
        description: row[1], 
        country: row[2].force_encoding(Encoding::UTF_8),
        city: row[3].force_encoding(Encoding::UTF_8),
        url: row[4].force_encoding(Encoding::UTF_8), 
        date_start: row[5], 
        date_end: row[6],
        venue: row[7].force_encoding(Encoding::UTF_8),
        address: row[8].force_encoding(Encoding::UTF_8)
        )
      ques.save
    end
  redirect_to hackathons_path, notice: "Hackathons added"
  end
  
  def export
    csv_data = CSV.generate do |csv|
      csv << [
        "title",
        "description",
        "country",
        "city",
        "url",
        "date_start",
        "date_end",
        "venue",
        "address",
        "challenge",
        "sponsors",
        "awards",
        "schedule",
        "application",
        "application_deadline"
      ]
      Hackathon.all.each do |hackathon|
        csv << [
          hackathon.title,
          hackathon.description,
          hackathon.country,
          hackathon.city,
          hackathon.url,
          hackathon.date_start,
          hackathon.date_end,
          hackathon.venue,
          hackathon.address,
          hackathon.challenge,
          hackathon.sponsors,
          hackathon.awards,
          hackathon.schedule,
          hackathon.application,
          hackathon.application_deadline
        ]
      end
    end
    
    send_data csv_data, filename: "export.csv", type: ' text/csv', disposition: 'attachment'
  end

  # PATCH/PUT /hackathons/1
  # PATCH/PUT /hackathons/1.json
  def update
    respond_to do |format|
      if @hackathon.update(hackathon_params)
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully updated.' }
        format.json { render :show, status: :ok, location: @hackathon }
      else
        format.html { render :edit }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackathons/1
  # DELETE /hackathons/1.json
  def destroy
    @hackathon.destroy
    respond_to do |format|
      format.html { redirect_to hackathons_url, notice: 'Hackathon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow
    current_user.follow_hackathon(@hackathon)
    redirect_to :back
  end

  def unfollow
    current_user.unfollow_hackathon(@hackathon)
    redirect_to :back
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hackathon
      @hackathon = Hackathon.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hackathon_params
      params.require(:hackathon).permit(:title, :description, :country, :city, :url, :date_start, :date_end, :venue, :address, :challenge, :sponsors, :awards, :schedule, :application, :application_deadline, :twitter, :longitude, :latitude)
    end

end


