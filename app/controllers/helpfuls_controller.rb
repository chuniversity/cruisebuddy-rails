class HelpfulsController < ApplicationController
  before_action :set_helpful, only: [:show, :update, :destroy]

  # GET /helpfuls
  def index
    @helpfuls = Helpful.all

    render json: @helpfuls
  end

  # GET /helpfuls/1
  def show
    render json: @helpful
  end

  # POST /helpfuls
  def create
    @helpful = Helpful.new(helpful_params)

    if @helpful.save
      render json: @helpful, status: :created, location: @helpful
    else
      render json: @helpful.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /helpfuls/1
  def update
    if @helpful.update(helpful_params)
      render json: @helpful
    else
      render json: @helpful.errors, status: :unprocessable_entity
    end
  end

  # DELETE /helpfuls/1
  def destroy
    @helpful.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_helpful
      @helpful = Helpful.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def helpful_params
      params.require(:helpful).permit(:user_profile_id, :review_id)
    end
end
