module ApplicationHelper
  def title(text=nil)
    content_for :title, (["Hackevents", text].compact.join " – ")
  end
end
