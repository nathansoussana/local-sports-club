class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @participant = Participant.new
    #authorize @event
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  #def event_params
   # params.require(:event).permit(:name, :address, :rating, :level, :date. :participant_level, :duration, :description)
  #end
end
