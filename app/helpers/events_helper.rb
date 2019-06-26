module EventsHelper
    def user_subscribed?(event_id)
        @user = current_user().id
        if AttendedEventsTbl.where(attendee_id: @user, attended_event_id: @event).count > 0
          return false
        elsif Event.where(id: @event, creator_id: @user).count > 0
            return false
        end
        return true
    end
end
