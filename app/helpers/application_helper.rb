module ApplicationHelper
  def title(text=nil)
    content_for :title, (["Hackevents", text].compact.join " – ")
  end
  
  def nice_hackathon_path(hackathon)
    hackathon_by_id_path(name: "#{hackathon.id}-#{hackathon.title}".parameterize.downcase, country: hackathon.country.parameterize.downcase, city_string: hackathon.city_string.parameterize.downcase)
  end

  def nice_hackathon_url(hackathon)
    hackathon_by_id_url(name: "#{hackathon.id}-#{hackathon.title}".parameterize.downcase, country: hackathon.country.parameterize.downcase, city_string: hackathon.city_string.parameterize.downcase)
  end

  def markdown(content)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    @markdown ||= Redcarpet::Markdown.new(renderer, extensions)
    @markdown.render(content).html_safe
  end
end
