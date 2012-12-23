# http://rubygems.org/gems/pusher
require 'pusher'

class MessagesController < ApplicationController
  before_filter :authenticate

  # POST /messages
  # POST /messages.json
  def create
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.create(params[:message])
    @message.user_name = session[:user_name] 

    respond_to do |format|
      if @message[:content].blank? or @message.save
        Pusher['presence-channel-' + params[:channel_id]].trigger('message_added', {message: {user_name: h(@message.user_name), content: h(@message.content)}, time: @message.created_at.localtime.strftime('%H:%M')})
        format.html { redirect_to root_path }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

end
