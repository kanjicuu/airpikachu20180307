require 'test_helper'

class RoomControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get room_index_url
    assert_response :success
  end

  test "should get new" do
    get room_new_url
    assert_response :success
  end

  test "should get create" do
    get room_create_url
    assert_response :success
  end

  test "should get basic" do
    get room_basic_url
    assert_response :success
  end

  test "should get pricing" do
    get room_pricing_url
    assert_response :success
  end

  test "should get description" do
    get room_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get room_photo_upload_url
    assert_response :success
  end

  test "should get youtube" do
    get room_youtube_url
    assert_response :success
  end

  test "should get level" do
    get room_level_url
    assert_response :success
  end

end
