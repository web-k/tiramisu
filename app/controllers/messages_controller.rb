# http://rubygems.org/gems/pusher
require 'pusher'

class MessagesController < ApplicationController
  before_filter :authenticate

  # GET /messages
  # GET /messages.json
  def index
    @messages = Channel.find(params[:channel_id]).messages.order("created_at DESC")
    @message = Channel.find(params[:channel_id]).messages.build

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @channel = Channel.find(params[:channel_id])
    @message = Channel.find(params[:channel_id]).messages.create(params[:message])
    @message.user_name = session[:user_name] 

    respond_to do |format|
      if @message[:content].blank? or @message.save
        Pusher['channel-' + params[:channel_id]].trigger('message_added', {message: {user_name: h(@message.user_name), content: h(@message.content)}, time: @message.created_at.localtime.strftime('%H:%M')})
        format.html { redirect_to root_path }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
