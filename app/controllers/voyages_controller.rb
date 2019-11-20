class VoyagesController < ApplicationController
  before_action :set_voyage, only: [:show, :update, :destroy]

  # GET /voyages
  def index
    @voyages = Voyage.all

    render json: @voyages
  end

  # GET /voyages/1
  def show
    render json: @voyage
  end

  # POST /voyages
  def create
    @voyage = Voyage.new(voyage_params)

    if @voyage.save
      render json: @voyage, status: :created, location: @voyage
    else
      render json: @voyage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /voyages/1
  def update
    if @voyage.update(voyage_params)
      render json: @voyage
    else
      render json: @voyage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /voyages/1
  def destroy
    @voyage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voyage
      @voyage = Voyage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def voyage_params
      params.require(:voyage).permit(:start, :end, :region_id)
    end
end
