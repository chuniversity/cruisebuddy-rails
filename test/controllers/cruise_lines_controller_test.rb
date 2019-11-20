require 'test_helper'

class CruiseLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cruise_line = cruise_lines(:one)
  end

  test "should get index" do
    get cruise_lines_url, as: :json
    assert_response :success
  end

  test "should create cruise_line" do
    assert_difference('CruiseLine.count') do
      post cruise_lines_url, params: { cruise_line: { name: @cruise_line.name } }, as: :json
    end

    assert_response 201
  end

  test "should show cruise_line" do
    get cruise_line_url(@cruise_line), as: :json
    assert_response :success
  end

  test "should update cruise_line" do
    patch cruise_line_url(@cruise_line), params: { cruise_line: { name: @cruise_line.name } }, as: :json
    assert_response 200
  end

  test "should destroy cruise_line" do
    assert_difference('CruiseLine.count', -1) do
      delete cruise_line_url(@cruise_line), as: :json
    end

    assert_response 204
  end
end
