class PusherController < ApplicationController
  protect_from_forgery except: :auth

  def auth
    if session[:user_name].present?
      session[:user_id] = request.session_options[:id]
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
        user_id: request.session_options[:id],
        user_info: {
          name: session[:user_name]
        }
      })
      render json: response
    else
      render text: "Forbidden", status: '403'
    end
  end
end
