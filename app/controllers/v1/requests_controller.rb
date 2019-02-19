class V1::RequestsController < ApplicationController
  def index
    @requests = Request.all
    render json: @requests
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @request = @request.new
  end

  def create
    @user = current_user
    @artist = Artist.find(params[:artist_id])
    @request = Request.new(request_params)
    @request.user = current_user
    @request.artist = @artist
    @request.save
  end

  def update
    @request = Request.find(params[:id])
    @request.update!(request_params)
    @user = @request.user
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
  end

  private

  def request_params
    params.require(:request).permit(:date, :price)
  end
end
