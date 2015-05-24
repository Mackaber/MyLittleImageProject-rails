require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  setup do
    @picture = pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pictures)
  end

  test "should create picture" do
    assert_difference('Picture.count') do
      post :create, picture: { title: @picture.title, url: @picture.url }
    end

    assert_response 201
  end

  test "should show picture" do
    get :show, id: @picture
    assert_response :success
  end

  test "should update picture" do
    put :update, id: @picture, picture: { title: @picture.title, url: @picture.url }
    assert_response 204
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete :destroy, id: @picture
    end

    assert_response 204
  end
end
