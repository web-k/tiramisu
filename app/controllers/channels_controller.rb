class ChannelsController < ApplicationController
  before_filter :authenticate

  def index
    @channels = Channel.all
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
    @messages = Channel.find(params[:id]).messages.order("created_at DESC")
    @message = Channel.find(params[:id]).messages.build
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to channels_path
  end
end
