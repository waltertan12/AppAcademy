class UsersController < ApplicationController
  before_action :pass_go, only: [:new]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # render json: @user
      login_user!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def pass_go
    redirect_to root_url if current_user
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
