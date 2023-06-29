class MessagesController < ApplicationController
  def create
    # content, chatroom, user
    puts params
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @chatroom = @event.chatroom
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message

    if @message.save
      redirect_to event_chatroom_path(@event)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
