# http://rubygems.org/gems/pusher
require 'pusher'

class ItemsController < ApplicationController
  before_filter :authenticate

  # POST /item/:id/event/move
  # POST /item/:id/event/move.json
  def move
    @item = Item.find(params[:id])
    @item.update_attributes! params.permit(:position_x, :position_y, :latest_moving_user_name)
    channel_id = @item.table.channel.id
    Pusher['presence-channel-' + channel_id.to_s].trigger('item_move', {user_id: session[:user_id], item_id: @item.id, position: {left: @item.position_x, top: @item.position_y}, latest_moving_user_name: @item.latest_moving_user_name})
    render nothing: true, status: 200
  end

end
