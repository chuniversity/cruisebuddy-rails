class CruiseLinesController < ApplicationController
  before_action :set_cruise_line, only: [:show, :update, :destroy]

  # GET /cruise_lines
  def index
    @cruise_lines = CruiseLine.all

    render json: @cruise_lines
  end

  # GET /cruise_lines/1
  def show
    render json: @cruise_line
  end

  # POST /cruise_lines
  def create
    @cruise_line = CruiseLine.new(cruise_line_params)

    if @cruise_line.save
      render json: @cruise_line, status: :created, location: @cruise_line
    else
      render json: @cruise_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cruise_lines/1
  def update
    if @cruise_line.update(cruise_line_params)
      render json: @cruise_line
    else
      render json: @cruise_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cruise_lines/1
  def destroy
    @cruise_line.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cruise_line
      @cruise_line = CruiseLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cruise_line_params
      params.require(:cruise_line).permit(:name)
    end
end
