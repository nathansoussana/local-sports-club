class ChatroomsController < ApplicationController
  def show
    @event = Event.find(params[:event_id])
    @chatroom = @event.chatroom
    authorize @chatroom
  end
end
