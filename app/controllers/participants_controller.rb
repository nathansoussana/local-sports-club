class ParticipantsController < ApplicationController
  before_action :set_event, only: %i[create destroy]

  def create
    @participant = Participant.find_by(event: @event, user: current_user)
    if @participant
      redirect_to event_path(@event), notice: "You are already a participant."
    authorize @participant
    else
    @participant = Participant.new
    authorize @participant
    @participant.event = @event
    @participant.user_id = current_user.id
    if @participant.save
      redirect_to event_path(@event), notice: "Participation was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
    end
  end

  def destroy
   @participant = Participant.find_by(event: @event, user: current_user)
    if @participant
      authorize @participant
      @participant.destroy
      redirect_to event_path(@event), notice: "You have successfully been removed."
    else
      @participant = Participant.new
      authorize @participant
      redirect_to event_path(params[:event_id]), notice: "You are not a participant."
    end
  end

end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
