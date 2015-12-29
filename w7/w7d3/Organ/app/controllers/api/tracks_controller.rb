class Api::TracksController < ApplicationController
  def index
    @tracks = Track.all
    render json: @tracks
  end

  def show
    @track = Track.find(params[:id])
    render json: @track
  end

  def create
    p params[:roll]
    @track = Track.new(track_params)

    if @track.save
      render json: @track
    else
      render json: {error: @track.errors.full_messages}, status: 422
    end
  end

  private
  def track_params
    params.require(:track).permit(:name, :roll)
  end
end
