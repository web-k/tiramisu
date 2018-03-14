class ChannelsController < ApplicationController
  before_action :authenticate

  def index
    @channels = Channel.order("created_at DESC")
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(params.require(:channel).permit(:name))
    if params[:table].present?
      template = TableTemplate.find params[:table]
      @channel.table = template.create if template.present?
    end
    if @channel.save
      redirect_to channels_path
    else
      redirect_to action: :index
    end
  end

  def show
    @channel = Channel.find(params[:id])
    @channels = Channel.all
    @messages = @channel.messages.order("created_at DESC")
    @message = @messages.build
    @table = @channel.table
    if @table.present?
      @latest_moving_item = @table.items.where('latest_moving_user_name IS NOT NULL').order('updated_at DESC').first
    end
  rescue ActiveRecord::RecordNotFound
    options = {status: 404, error_label: 'not_found'}
    render_error(options)
  end

  def update
    @channel = Channel.find(params[:id])
    @channel.name = params[:channel][:name]
    @channel.save!
    redirect_to(controller: 'channels', action: 'show')
  end

end
