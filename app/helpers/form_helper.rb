module FormHelper
  def setup_hackathon(hackathon)
    # ... code from above omitted

    hackathon.events.build
    hackathon
  end
end