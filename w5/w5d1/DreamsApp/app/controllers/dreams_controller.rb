class DreamsController < ApplicationController
  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user_id = current_user.id
    if @dream.save
      redirect_to dream_url(@dream)
    else
      flash.now[:errors] = ["!NIGHTMARE!"]
      render :new
    end
  end

  def index
    @dreams = Dream.includes(:user).all
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.update(dream_params)
      redirect_to dream_url(@dream)
    else
      flash.now[:errors] = ["asdfadsfajdfkl;adsfjas;dkf"]
      render :edit
    end
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:title, :content, :completeness, :spooky)
  end
end
