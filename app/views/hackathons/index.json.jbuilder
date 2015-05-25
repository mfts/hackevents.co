json.array!(@hackathons) do |hackathon|
  json.extract! hackathon, :id, :title, :description, :country, :city, :url, :date_start, :date_end, :venue, :address, :challenge, :sponsors, :awards, :schedule, :application, :application_deadline
  json.url hackathon_url(hackathon, format: :json)
end
