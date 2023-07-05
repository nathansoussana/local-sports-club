class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    event = Event.find(params[:id])
    chatroom = event.chatroom
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
