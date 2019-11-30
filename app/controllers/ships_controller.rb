class ShipsController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_ship, only: [:show, :update, :destroy]

  # GET /ships
  def index
    @ships = Ship.all

    render json: {
      ships: @ships.map do |ship|
        {
          id: ship.id,
          name: ship.name,
          description: ship.description,
          url: ship.url,
          cruise_name: ship.cruise_line,
          reviews: ship.reviews,
        }
      end 
    }
  end

  # GET /ships/1
  def show
    render json: {
      id: @ship.id,
      name: @ship.name,
      description: @ship.description,
      cruise_line: @ship.cruise_line,
      ship_images: @ship.ship_images,
      reviews: @ship.reviews.preload(:user_profile).map do |review|
        {
          id: review.id,
          body: review.body,
          rating: review.rating,
          user_profile: review.user_profile,
        }
      end
    }
  end

  # POST /ships
  def create
    @ship = Ship.new(ship_params)

    if @ship.save
      render json: @ship, status: :created, location: @ship
    else
      render json: @ship.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ships/1
  def update
    if @ship.update(ship_params)
      render json: @ship
    else
      render json: @ship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ships/1
  def destroy
    @ship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ship
      @ship = Ship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ship_params
      params.require(:ship).permit(:name, :cruise_line_id)
    end
end
