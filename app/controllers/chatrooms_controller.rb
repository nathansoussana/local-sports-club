class ChatroomsController < ApplicationController
  def show
    @event = Event.find(params[:event_id])
    @chatroom = @event.chatroom
    @messages = @chatroom.messages
    @message = Message.new
    authorize @chatroom
  end
end
