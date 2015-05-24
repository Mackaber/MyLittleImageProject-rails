class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = current_user.pictures

    render json: @pictures
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    render json: @picture
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      render json: @picture, status: :created, location: @picture
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])

    if @picture.update(params[:picture])
      head :no_content
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    #def set_user
    #  @user = Picture.
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.permit(:title, :image, :album_id)
    end
end
