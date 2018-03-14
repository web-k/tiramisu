# http://rubygems.org/gems/pusher
require 'pusher'

class ItemsController < ApplicationController
  before_action :authenticate

  # POST /item/:id/event/move
  # POST /item/:id/event/move.json
  def move
    move_params = params.permit(:id, :position_x, :position_y, :latest_moving_user_name)
    @item = Item.find move_params[:id]
    @item.update! move_params
    channel_id = @item.table.channel.id
    Pusher['presence-channel-' + channel_id.to_s].trigger('item_move', {user_id: session[:user_id], item_id: @item.id, position: {left: @item.position_x, top: @item.position_y}, latest_moving_user_name: @item.latest_moving_user_name})
    render status: :ok, body: nil
  end

end
