class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = current_user.albums

    render json: @albums
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])

    render json: @album
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      head :no_content
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def album_params
    params.permit(:title)
  end
end
