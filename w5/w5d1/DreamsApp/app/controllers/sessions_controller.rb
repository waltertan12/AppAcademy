class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login!(@user)
      redirect_to dreams_url
    else
      flash.now[:errors] = ["GIVE UP"]
      render :new
    end
  end

  def destroy
    logout!
  end

end
