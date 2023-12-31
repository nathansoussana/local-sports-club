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
      ChatroomChannel.broadcast_to(
        @chatroom,
        {
          message: render_to_string(partial: "shared/message", locals: { message: @message}),
          sender_id: @message.user.id
        }
      )
      head :ok
    else
      render "events/show", status: :unprocessable_entity
    end

  end

  

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
