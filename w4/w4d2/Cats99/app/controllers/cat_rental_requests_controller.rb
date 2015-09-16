class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    render :new
  end

  def show
    @request = CatRentalRequest.find(params[:id])
    render :show
  end

  def create
    @request = CatRentalRequest.new(request_params)
    if @request.save
      redirect_to cat_rental_request_path(@request)
    else
      # @cats = Cat.all
      render :new
    end
  end

  def approve
    @request = CatRentalRequest.find(params[:id])
    @request.approve!
    redirect_to cat_path(@request.cat_id)
  end

  def deny
    @request = CatRentalRequest.find(params[:id])
    @request.deny!
    redirect_to cat_path(@request.cat_id)
  end

  private
  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end

end
