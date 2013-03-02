# http://rubygems.org/gems/pusher
require 'pusher'

class MessagesController < ApplicationController
  before_filter :authenticate

  # POST /messages
  # POST /messages.json
  def create
    render(status: :forbidden, text: 'Invalid message') and return if (params[:message].blank? or params[:message][:content].blank?)
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.create(params.require(:message).permit(:content))
    @message.user_name = session[:user_name] 

      if @message.save
        Pusher['presence-channel-' + params[:channel_id]].trigger('message_added', {message: {user_name: h(@message.user_name), content: view_context.auto_link(@message.content)}, time: @message.created_at.localtime.strftime('%H:%M')})
        render status: :created, nothing: true
      else
        render status: :forbiden, text: 'The message can\'t save'
      end
  end

end
