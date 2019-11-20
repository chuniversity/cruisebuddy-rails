require 'test_helper'

class PortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @port = ports(:one)
  end

  test "should get index" do
    get ports_url, as: :json
    assert_response :success
  end

  test "should create port" do
    assert_difference('Port.count') do
      post ports_url, params: { port: { name: @port.name } }, as: :json
    end

    assert_response 201
  end

  test "should show port" do
    get port_url(@port), as: :json
    assert_response :success
  end

  test "should update port" do
    patch port_url(@port), params: { port: { name: @port.name } }, as: :json
    assert_response 200
  end

  test "should destroy port" do
    assert_difference('Port.count', -1) do
      delete port_url(@port), as: :json
    end

    assert_response 204
  end
end
