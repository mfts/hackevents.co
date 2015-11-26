class Organization < ActiveRecord::Base
  belongs_to :organized_hackathon, class_name: "Hackathon", foreign_key: "organized_hackathon_id"
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"
end
