class Event < ApplicationRecord
  belongs_to :hackathon, optional: true
end
