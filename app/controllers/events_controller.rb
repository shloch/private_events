class EventsController < ApplicationController
  def index
      @events = Event.all.paginate(page: params[:page])
  
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user().created_events.build(event_params) 
    if @event.save
      flash[:info] = "Event succesfully created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:name, :eventdate, :location)
    end
end
