class AttendedEventsTbl < ApplicationRecord
	belongs_to :event_attendee, class_name: "User"
        belongs_to :event_attended, class_name: "Event"
end
