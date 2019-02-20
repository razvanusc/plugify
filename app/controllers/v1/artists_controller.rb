class V1::ArtistsController < ApplicationController
  def index
    @artists = policy_scope(Artist).all
    render json: @artists
  end

  def show
    @artist = Artist.find(params[:id])
    authorize @artist
    render json: @artist
  end

  def create
    @artist = Artist.new(artist_params)
    authorize @artist
    render json: @artist if @artist.save
  end

  def update
    @artist = Artist.find(params[:id])
    authorize @artist
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    authorize @artist
    @artist.destroy
  end

  private
  
  def artist_params
    params.require(:artist).permit(:name, :bio, :genre, :price_per_hour)
  end
end
