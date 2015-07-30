module Admin
  class HackathonsController < BaseController
    before_action :set_hackathon, only: [:edit, :update, :destroy]
    
    def index
      @hackathons = Hackathon.where("date_start >= ?", Time.zone.now).order(:date_start)
    end
    
    def new
      @hackathon = Hackathon.new
    end

    def create
      @hackathon = Hackathon.new(hackathon_params)

      if @hackathon.save
        redirect_to edit_admin_hackathon_path(@hackathon), notice: 'Hackathon was successfully created.'
      else
        render :new
      end
    end
    
    def edit
    end

    def update
      if @hackathon.update(hackathon_params)
        redirect_to edit_admin_hackathon_path(@hackathon), notice: 'Hackathon was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @hackathon.destroy
      redirect_to admin_hackathons_url, notice: 'Hackathon was successfully destroyed.'
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
    redirect_to admin_hackathons_path, notice: "Hackathons added"
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

    private

    def set_hackathon
      @hackathon = Hackathon.friendly.find(params[:id])
    end

    def hackathon_params
      params.require(:hackathon).permit(:title, :description, :country, :city, :url, :date_start, :date_end, :venue, :address, :challenge, :sponsors, :awards, :schedule, :application, :application_deadline, :twitter, :longitude, :latitude, { category_ids: [] }, { sponsor_ids: [] })
    end
  end
end