class Event < ApplicationRecord
    has_many :attended_events_tbl, foreign_key: :event_attended_id
    has_many :event_attendee, through: :attended_events_tbl


    belongs_to :creator, class_name: "User"
end
