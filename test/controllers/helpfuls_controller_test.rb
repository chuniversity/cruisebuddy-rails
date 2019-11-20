require 'test_helper'

class HelpfulsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @helpful = helpfuls(:one)
  end

  test "should get index" do
    get helpfuls_url, as: :json
    assert_response :success
  end

  test "should create helpful" do
    assert_difference('Helpful.count') do
      post helpfuls_url, params: { helpful: { review_id: @helpful.review_id, user_profile_id: @helpful.user_profile_id } }, as: :json
    end

    assert_response 201
  end

  test "should show helpful" do
    get helpful_url(@helpful), as: :json
    assert_response :success
  end

  test "should update helpful" do
    patch helpful_url(@helpful), params: { helpful: { review_id: @helpful.review_id, user_profile_id: @helpful.user_profile_id } }, as: :json
    assert_response 200
  end

  test "should destroy helpful" do
    assert_difference('Helpful.count', -1) do
      delete helpful_url(@helpful), as: :json
    end

    assert_response 204
  end
end
