class VoyagePortsController < ApplicationController
  before_action :set_voyage_port, only: [:show, :update, :destroy]

  # GET /voyage_ports
  def index
    @voyage_ports = VoyagePort.all

    render json: @voyage_ports
  end

  # GET /voyage_ports/1
  def show
    render json: @voyage_port
  end

  # POST /voyage_ports
  def create
    @voyage_port = VoyagePort.new(voyage_port_params)

    if @voyage_port.save
      render json: @voyage_port, status: :created, location: @voyage_port
    else
      render json: @voyage_port.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /voyage_ports/1
  def update
    if @voyage_port.update(voyage_port_params)
      render json: @voyage_port
    else
      render json: @voyage_port.errors, status: :unprocessable_entity
    end
  end

  # DELETE /voyage_ports/1
  def destroy
    @voyage_port.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voyage_port
      @voyage_port = VoyagePort.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def voyage_port_params
      params.require(:voyage_port).permit(:port_id, :voyage_id)
    end
end
