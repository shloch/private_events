class Event < ApplicationRecord
    has_many :attended_events_tbl, foreign_key: :attended_event_id
    has_many :attendee, through: :attended_events_tbl
    belongs_to :creator, class_name: "User"

    validates :name , presence: true, length: {maximum:50}
    validates :location, presence: true, length: {maximum:50}
    validates :eventdate, presence: true

    scope :upcoming_events, -> { select(:name,:id).where("eventdate >= ?", Time.current)}
    scope :past_events,-> {select(:name,:id).where("eventdate <= ?", Time.current)}

    def Event.upcoming
        Event.upcoming_events
    end

    def Event.past 
        Event.past_events 
    end
end
