require 'test_helper'

class VoyagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voyage = voyages(:one)
  end

  test "should get index" do
    get voyages_url, as: :json
    assert_response :success
  end

  test "should create voyage" do
    assert_difference('Voyage.count') do
      post voyages_url, params: { voyage: { end: @voyage.end, region_id: @voyage.region_id, start: @voyage.start } }, as: :json
    end

    assert_response 201
  end

  test "should show voyage" do
    get voyage_url(@voyage), as: :json
    assert_response :success
  end

  test "should update voyage" do
    patch voyage_url(@voyage), params: { voyage: { end: @voyage.end, region_id: @voyage.region_id, start: @voyage.start } }, as: :json
    assert_response 200
  end

  test "should destroy voyage" do
    assert_difference('Voyage.count', -1) do
      delete voyage_url(@voyage), as: :json
    end

    assert_response 204
  end
end
