require 'test_helper'

class PortImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @port_image = port_images(:one)
  end

  test "should get index" do
    get port_images_url, as: :json
    assert_response :success
  end

  test "should create port_image" do
    assert_difference('PortImage.count') do
      post port_images_url, params: { port_image: { port_id: @port_image.port_id, url: @port_image.url } }, as: :json
    end

    assert_response 201
  end

  test "should show port_image" do
    get port_image_url(@port_image), as: :json
    assert_response :success
  end

  test "should update port_image" do
    patch port_image_url(@port_image), params: { port_image: { port_id: @port_image.port_id, url: @port_image.url } }, as: :json
    assert_response 200
  end

  test "should destroy port_image" do
    assert_difference('PortImage.count', -1) do
      delete port_image_url(@port_image), as: :json
    end

    assert_response 204
  end
end
