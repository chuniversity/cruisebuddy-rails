class PortsController < ApplicationController
  before_action :set_port, only: [:show, :update, :destroy]

  # GET /ports
  def index
    @ports = Port.all

    render json: @ports
  end

  # GET /ports/1
  def show
    render json: @port
  end

  # POST /ports
  def create
    @port = Port.new(port_params)

    if @port.save
      render json: @port, status: :created, location: @port
    else
      render json: @port.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ports/1
  def update
    if @port.update(port_params)
      render json: @port
    else
      render json: @port.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ports/1
  def destroy
    @port.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_port
      @port = Port.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def port_params
      params.require(:port).permit(:name)
    end
end
