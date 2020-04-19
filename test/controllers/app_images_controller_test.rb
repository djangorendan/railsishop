require 'test_helper'

class AppImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_image = app_images(:one)
  end

  test "should get index" do
    get app_images_url
    assert_response :success
  end

  test "should get new" do
    get new_app_image_url
    assert_response :success
  end

  test "should create app_image" do
    assert_difference('AppImage.count') do
      post app_images_url, params: { app_image: {  } }
    end

    assert_redirected_to app_image_url(AppImage.last)
  end

  test "should show app_image" do
    get app_image_url(@app_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_image_url(@app_image)
    assert_response :success
  end

  test "should update app_image" do
    patch app_image_url(@app_image), params: { app_image: {  } }
    assert_redirected_to app_image_url(@app_image)
  end

  test "should destroy app_image" do
    assert_difference('AppImage.count', -1) do
      delete app_image_url(@app_image)
    end

    assert_redirected_to app_images_url
  end
end
