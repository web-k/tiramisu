# http://rubygems.org/gems/pusher
require 'pusher'

class ItemsController < ApplicationController
  before_filter :authenticate

  # POST /item/:id/event/move
  # POST /item/:id/event/move.json
  def move
    @item = Item.find(params[:id])
    @item.position_x = params[:position_x]
    @item.position_y = params[:position_y]
    @item.save!
    render nothing: true, status: 200
  end

end
