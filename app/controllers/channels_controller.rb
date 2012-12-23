class ChannelsController < ApplicationController
  before_filter :authenticate

  def index
    @channels = Channel.order("created_at DESC")
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(params[:channel])
    if @channel.save
      redirect_to channels_path
    else
      render action: 'index'
    end
  end

  def show
    @channel = Channel.find(params[:id])
    @messages = @channel.messages.order("created_at DESC")
    @message = @messages.build
  end

end
