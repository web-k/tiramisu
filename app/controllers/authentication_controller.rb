class AuthenticationController < ActionController::Base
  def index
    @callback_url = params[:callback]
    render layout: 'top'
  end

  def login
    session[:user_name] = params[:user_name]
    callback_url = params[:callback]
    redirect_to(callback_url.present? ? callback_url : root_path)
  end

  def logout
    reset_session
    redirect_to(:controller => 'authentication', :action => 'index')
  end
end
