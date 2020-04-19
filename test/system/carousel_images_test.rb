require "application_system_test_case"

class CarouselImagesTest < ApplicationSystemTestCase
  setup do
    @carousel_image = carousel_images(:one)
  end

  test "visiting the index" do
    visit carousel_images_url
    assert_selector "h1", text: "Carousel Images"
  end

  test "creating a Carousel image" do
    visit carousel_images_url
    click_on "New Carousel Image"

    fill_in "Image", with: @carousel_image.image
    fill_in "Name", with: @carousel_image.name
    click_on "Create Carousel image"

    assert_text "Carousel image was successfully created"
    click_on "Back"
  end

  test "updating a Carousel image" do
    visit carousel_images_url
    click_on "Edit", match: :first

    fill_in "Image", with: @carousel_image.image
    fill_in "Name", with: @carousel_image.name
    click_on "Update Carousel image"

    assert_text "Carousel image was successfully updated"
    click_on "Back"
  end

  test "destroying a Carousel image" do
    visit carousel_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carousel image was successfully destroyed"
  end
end
