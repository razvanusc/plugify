class V1::ArtistsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    render json: @artist
  end

  def create
    @artist = Artist.new(artist_params)
    render json: @artist if @artist.save
  end

  def update
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @artist.destroy
  end

  private

  def set_post
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio, :genre, :price_per_hour)
  end
end
