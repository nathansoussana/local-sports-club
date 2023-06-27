class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = policy_scope(Event)
  end

  def search
    @events = policy_scope(Event).search(params[:search])
    respond_to do |format|
      format.js { render partial: 'search_results', locals: { events: @events } }
    end
  end

  def show
    @event = Event.find(params[:id])
    @participant = Participant.new
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event #please leave this line before the save line (if statement)
    if @event.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to event_path(@event), notice: "Event was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @event
  end

  def update
    authorize @event #please leave this line before the save line (if statement)
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to root_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:name, :address, :level, :date, :participant_number, :duration, :description, :sport_id)
  end
end
