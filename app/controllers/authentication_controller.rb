class AuthenticationController < ActionController::Base
  def index
    render layout: 'top'
  end

  def login
    session[:user_name] = params[:user_name]
    redirect_to root_path
  end

  def logout
    reset_session
    redirect_to(:controller => 'authentication', :action => 'index')
  end
end
