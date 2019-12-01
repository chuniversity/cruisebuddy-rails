class ShipImagesController < ApplicationController
    skip_before_action :authenticate_request
  before_action :set_ship_image, only: [:show, :update, :destroy]

  # GET /ship_images
  def index
    @ship_images = ShipImage.all

    render json: @ship_images
  end

  # GET /ship_images/1
  def show
    render json: @ship_image
  end

  # POST /ship_images
  def create
    @ship_image = ShipImage.new(ship_image_params)

    if @ship_image.save
      render json: @ship_image, status: :created, location: @ship_image
    else
      render json: @ship_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ship_images/1
  def update
    if @ship_image.update(ship_image_params)
      render json: @ship_image
    else
      render json: @ship_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ship_images/1
  def destroy
    @ship_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ship_image
      @ship_image = ShipImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ship_image_params
      params.require(:ship_image).permit(:url, :ship_id)
    end
end
