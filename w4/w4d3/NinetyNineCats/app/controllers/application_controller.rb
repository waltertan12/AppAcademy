class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_session = UserSession.find_by(session_token: session[:session_token])
    (@current_user ||= User.find_by(id: @current_session.user_id)) if @current_session
  end


  def login_user!(user)
    session[:session_token] = user.session_token
    UserSession.create!(user_id: user.id,
                        session_token: session[:session_token],
                        browser_type:  request.env['HTTP_USER_AGENT'])
  end
end
