module ApplicationHelper
  def title(text=nil)
    content_for :title, (["Hackevents", text].compact.join " – ")
  end
  
  def nice_hackathon_path(hackathon)
    hackathon_by_id_path(name: "#{hackathon.id}-#{hackathon.title}".parameterize.downcase, country: hackathon.country.parameterize.downcase, city_string: hackathon.city_string.parameterize.downcase)
  end
end
