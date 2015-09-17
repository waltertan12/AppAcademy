class CatsController < ApplicationController

  before_action :rightful_cat_owner, only: [:edit, :update]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.includes(:rental_requests).find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:danger] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.includes(:rental_requests).find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:danger] = @cat.errors.full_messages
      render :edit
    end
  end

  def rightful_cat_owner
    @cat = Cat.find(params[:id])
    @cat.user_id == current_user.id ? true : (redirect_to root_url)
  end



  private

  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
