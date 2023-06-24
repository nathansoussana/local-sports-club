class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = policy_scope(Event).all
  end

  def show
    @event = Event.find(params[:id])
    @participant = Participant.new
    authorize @event
  end

  def new
    authorize @event
  end

  def create
    authorize @event #please leave this line before the save line (if statement)
  end

  def edit
    authorize @event
  end

  def update
    authorize @event #please leave this line before the save line (if statement)
  end

  def destroy
    authorize @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  #def event_params
   # params.require(:event).permit(:name, :address, :rating, :level, :date. :participant_level, :duration, :description)
  #end
end
