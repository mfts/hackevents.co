module ApplicationHelper
  def title(text=nil)
    content_for :title, (["Hackevents", text].compact.join " – ")
  end
  
  def nice_hackathon_path(hackathon)
    hackathon_by_id_path(name: "#{hackathon.id}-#{hackathon.title}".parameterize.downcase, country: hackathon.country.parameterize.downcase, city: hackathon.city.parameterize.downcase)
  end

  def nice_hackathon_url(hackathon)
    hackathon_by_id_url(name: "#{hackathon.id}-#{hackathon.title}".parameterize.downcase, country: hackathon.country.parameterize.downcase, city: hackathon.city.parameterize.downcase)
  end
end
