class ThingWithImagesController < ApplicationController 
  skip_before_action :authenticate_request
  def index 
    @things = ThingWithImage.all
  end 

  def new 
    @thing = ThingWithImage.new
  end 

  def create 
    @thing = ThingWithImage.new(thing_with_images_params)
    redirect_to thing_with_images_path if @thing.save
  end 

  private
  def thing_with_images_params 
    params.require(:thing_with_image).permit(:name, :image)
  end 
end 