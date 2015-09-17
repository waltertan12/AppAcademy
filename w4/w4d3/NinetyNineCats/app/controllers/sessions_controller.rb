class SessionsController < ApplicationController
  before_action :pass_go, only: [:new]

  def new
    render :new
  end

  def create
    @user = User::find_by_credentials(params[:user][:user_name],
                                      params[:user][:password])
    if @user.nil?
      flash.now[:danger] = "Cannot find user"
      render :new
    else
      flash[:success] = "Welcome, #{@user.user_name}"
      @user.reset_session_token!
      login_user!(@user)
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token!
    UserSession.find_by(session_token: session[:session_token]).destroy!
    session[:session_token] = nil
    redirect_to root_url
  end

  def destroy_all
    sessionsz = UserSession.where(user_id: current_user.id)
    sessionsz.each { |sessionz| sessionz.destroy }
    redirect_to root_url
  end

  def pass_go
    redirect_to root_url if current_user
  end
end
