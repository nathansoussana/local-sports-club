class MessagesController < ApplicationController
  def create
    # content, chatroom, user
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @chatroom = @event.chatroom
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message

    if @message.save
      redirect_to event_path(@event, anchor: "wall")
    else
      render "events/show", status: :unprocessable_entity
    end

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
