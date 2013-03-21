class ApplicationController < ActionController::Base
  protect_from_forgery
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
end
