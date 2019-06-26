class AttendedEventsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: [:create]

  
  def create
    attendee_id = current_user().id
    @attend = AttendedEventsTbl.new(attendee_id: attendee_id, attended_event_id: params[:event])
    @attend.save
    flash[:success] = "Succesfully subscribed to the event."
    redirect_to user_path current_user
  end

end
