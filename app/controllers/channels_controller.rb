class ChannelsController < ApplicationController
  before_filter :authenticate

  def index
    @channels = Channel.order("created_at DESC")
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(params[:channel])
    if params[:table].present?
      template = TableTemplate.find params[:table]
      @channel.table = template.create if template.present?
    end
    if @channel.save
      redirect_to channels_path
    else
      render action: 'index'
    end
  end

  def show
    @channel = Channel.find(params[:id])
    @channels = Channel.all
    @messages = @channel.messages.order("created_at DESC")
    @message = @messages.build
    @table = @channel.table
  end

end
