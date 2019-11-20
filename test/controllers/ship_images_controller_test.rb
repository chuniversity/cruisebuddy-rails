require 'test_helper'

class ShipImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ship_image = ship_images(:one)
  end

  test "should get index" do
    get ship_images_url, as: :json
    assert_response :success
  end

  test "should create ship_image" do
    assert_difference('ShipImage.count') do
      post ship_images_url, params: { ship_image: { ship_id: @ship_image.ship_id, url: @ship_image.url } }, as: :json
    end

    assert_response 201
  end

  test "should show ship_image" do
    get ship_image_url(@ship_image), as: :json
    assert_response :success
  end

  test "should update ship_image" do
    patch ship_image_url(@ship_image), params: { ship_image: { ship_id: @ship_image.ship_id, url: @ship_image.url } }, as: :json
    assert_response 200
  end

  test "should destroy ship_image" do
    assert_difference('ShipImage.count', -1) do
      delete ship_image_url(@ship_image), as: :json
    end

    assert_response 204
  end
end
