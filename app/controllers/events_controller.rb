class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = policy_scope(Event)

    if params[:search].present? && params[:search][:query].present?
      @search_query = params[:search][:query]
      @events = Event.search(@search_query)
    else
      @events = Event.all
    end
  end

  def show
    @creator = @event.user
    @participant = Participant.new
    @sport = @event.sport
    @chatroom = @event.chatroom
    @messages = @chatroom.messages
    @message = Message.new
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

  def search
    @search_query = params[:search_query]
    @events = Event.search(@search_query)
  end
end
