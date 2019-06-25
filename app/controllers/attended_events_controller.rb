class AttendedEventsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  before_action :check_subscription_status, only: [:create]

  
  def create
    @user = current_user().id
    @attend = AttendedEventsTbl.new(attendee_id: @user, attended_event_id: params[:event])
    @attend.save
    flash[:success] = "Succesfully subscribed to the event."
    redirect_to "/users/#{@user}"
  end

  private 
    def check_subscription_status
        @event = params[:event]
        @user = current_user().id
        if AttendedEventsTbl.where(attendee_id: @user, attended_event_id: @event).count > 0
          flash[:info] = "U have already subscribed to this event."
          redirect_to "/events/#{@event}/"
        elsif Event.where(id: @event, creator_id: @user).count > 0
          flash[:info] = "U are the creator of this event u dont need to subscribe." 
          redirect_to "/events/#{@event}/"
        end
    end

end
