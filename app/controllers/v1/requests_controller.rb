class V1::RequestsController < ApplicationController
  def index
    if current_user == user.admin
      @requests = policy_scope(Request).all
    else if current_user != user.admin
      @requests = policy_scope(Request).where(@user == current_user)
    end
    render json: @requests
  end

  def new
    @artist = Artist.find(params[:artist_id])
    authorize @request
    @request = @request.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    authorize @request
    @request = Request.new(request_params)
    @request.user = current_user
    @request.artist = @artist
    @request.save
    render json: @request
  end

  def update
    @request = Request.find(params[:id])
    authorize @request
    @request.update!(request_params)
    render json: @request
  end

  def destroy
    @request = Request.find(params[:id])
    authorize @request
    @request.destroy
  end

  private

  def request_params
    params.require(:request).permit(:date, :price)
  end
end
end
