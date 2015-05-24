require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  setup do
    @video = videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos)
  end

  test "should create video" do
    assert_difference('Video.count') do
      post :create, video: { album_id: @video.album_id, description: @video.description, title: @video.title }
    end

    assert_response 201
  end

  test "should show video" do
    get :show, id: @video
    assert_response :success
  end

  test "should update video" do
    put :update, id: @video, video: { album_id: @video.album_id, description: @video.description, title: @video.title }
    assert_response 204
  end

  test "should destroy video" do
    assert_difference('Video.count', -1) do
      delete :destroy, id: @video
    end

    assert_response 204
  end
end
