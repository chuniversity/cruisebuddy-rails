require 'test_helper'

class VoyagePortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voyage_port = voyage_ports(:one)
  end

  test "should get index" do
    get voyage_ports_url, as: :json
    assert_response :success
  end

  test "should create voyage_port" do
    assert_difference('VoyagePort.count') do
      post voyage_ports_url, params: { voyage_port: { port_id: @voyage_port.port_id, voyage_id: @voyage_port.voyage_id } }, as: :json
    end

    assert_response 201
  end

  test "should show voyage_port" do
    get voyage_port_url(@voyage_port), as: :json
    assert_response :success
  end

  test "should update voyage_port" do
    patch voyage_port_url(@voyage_port), params: { voyage_port: { port_id: @voyage_port.port_id, voyage_id: @voyage_port.voyage_id } }, as: :json
    assert_response 200
  end

  test "should destroy voyage_port" do
    assert_difference('VoyagePort.count', -1) do
      delete voyage_port_url(@voyage_port), as: :json
    end

    assert_response 204
  end
end
