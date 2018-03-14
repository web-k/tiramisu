class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ERB::Util

  def login?
    session[:user_name].present?
  end

  def authenticate
    unless login?
      callback_url = (request.fullpath.present? && request.fullpath != '/') ? request.fullpath : nil
      redirect_to controller: 'authentication', action: 'index', callback: callback_url
      return false
    end
  end

  ERROR_TITLE = {
    not_found: 'Not Found'
  }.freeze

  def render_error(options = {})
    status = options[:status] || 404
    @error_title = ERROR_TITLE[:"#{options[:error_label]}"] || ERROR_TITLE[:not_found]
    redirect_url = options[:redirect_url]

    if redirect_url.nil?
      respond_to do |format|
        format.html { render '/error', status: status }
        format.json { render status: status, body: nil }
      end
    else
      session[:error_title] = @error_title
      redirect_to redirect_url
    end
  end
end
