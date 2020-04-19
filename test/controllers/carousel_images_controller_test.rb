require 'test_helper'

class CarouselImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carousel_image = carousel_images(:one)
  end

  test "should get index" do
    get carousel_images_url
    assert_response :success
  end

  test "should get new" do
    get new_carousel_image_url
    assert_response :success
  end

  test "should create carousel_image" do
    assert_difference('CarouselImage.count') do
      post carousel_images_url, params: { carousel_image: { image: @carousel_image.image, name: @carousel_image.name } }
    end

    assert_redirected_to carousel_image_url(CarouselImage.last)
  end

  test "should show carousel_image" do
    get carousel_image_url(@carousel_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_carousel_image_url(@carousel_image)
    assert_response :success
  end

  test "should update carousel_image" do
    patch carousel_image_url(@carousel_image), params: { carousel_image: { image: @carousel_image.image, name: @carousel_image.name } }
    assert_redirected_to carousel_image_url(@carousel_image)
  end

  test "should destroy carousel_image" do
    assert_difference('CarouselImage.count', -1) do
      delete carousel_image_url(@carousel_image)
    end

    assert_redirected_to carousel_images_url
  end
end
