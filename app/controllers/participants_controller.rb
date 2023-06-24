class ParticipantsController < ApplicationController
  before_action :set_event, only: %i[create]

  def create
    @participant = Participant.new
    @participant.event = @event
    @participant.user_id = current_user.id
    if @participant.save
      redirect_to event_path(@event), notice: "Participation was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
    #authorize @participant
  end
end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
