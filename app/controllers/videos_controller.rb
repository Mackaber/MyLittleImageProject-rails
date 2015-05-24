class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos  = current_user.videos

    render json: @videos
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    render json: @video
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    if @video.save
      render json: @video, status: :created, location: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      head :no_content
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_params
    params.permit(:title, :video, :album_id)
  end
end
