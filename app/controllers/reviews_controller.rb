class ReviewsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews 
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    ship = Ship.find_by(name: params[:ship][:shipName])
    ship_image = params[:ship][:shipImage];
    @review = Review.new(review_params)
    @review.ship = ship
    @review.user_profile = @current_user.user_profile
    @review.save
    ship.ship_images.create(review: @review, ship: ship, image: ship_image) if !ship_image.blank?
    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:body, :rating)
    end
end
