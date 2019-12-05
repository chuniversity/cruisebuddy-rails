class ShipsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
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
      voyages: @ship.voyages,
      ship_images: @ship.ship_images.map do |ship_image|
        {
          id: ship_image.id,
          url: ship_image.image.attached? ? url_for(ship_image.image) : ship_image.url,
        }
      end,
      reviews: @ship.reviews.preload(:user_profile).map do |review|
        review_image = review.ship_image
        {
          id: review.id,
          body: review.body,
          rating: review.rating,
          created_at: review.created_at.strftime("%m/%d/%Y"),
          user_profile: review.user_profile,
          ship_image: review_image&.image&.attached? ? url_for(review_image.image) : review_image&.url,
          comments: review.comments.map do |comment|
            {
              id: comment.id,
              body: comment.body,
              created_at: comment.created_at.strftime("%m/%d/%Y"),
              user_profile: comment.user_profile,
            }
          end
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
