class Event < ApplicationRecord
    has_many :attended_events_tbl, foreign_key: :attended_event_id
    has_many :attendee, through: :attended_events_tbl
    belongs_to :creator, class_name: "User"

    def Event.upcoming
        Event.select(:name,:id).where("eventdate >= ?", Time.current) 
    end

    def Event.past 
        Event.select(:name,:id).where("eventdate <= ?", Time.current) 
    end
end
