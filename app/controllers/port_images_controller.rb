class PortImagesController < ApplicationController
  before_action :set_port_image, only: [:show, :update, :destroy]

  # GET /port_images
  def index
    @port_images = PortImage.all

    render json: @port_images
  end

  # GET /port_images/1
  def show
    render json: @port_image
  end

  # POST /port_images
  def create
    @port_image = PortImage.new(port_image_params)

    if @port_image.save
      render json: @port_image, status: :created, location: @port_image
    else
      render json: @port_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /port_images/1
  def update
    if @port_image.update(port_image_params)
      render json: @port_image
    else
      render json: @port_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /port_images/1
  def destroy
    @port_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_port_image
      @port_image = PortImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def port_image_params
      params.require(:port_image).permit(:url, :port_id)
    end
end
