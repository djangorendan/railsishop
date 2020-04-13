require "application_system_test_case"

class ProductPhotosTest < ApplicationSystemTestCase
  setup do
    @product_photo = product_photos(:one)
  end

  test "visiting the index" do
    visit product_photos_url
    assert_selector "h1", text: "Product Photos"
  end

  test "creating a Product photo" do
    visit product_photos_url
    click_on "New Product Photo"

    fill_in "Image", with: @product_photo.image
    check "Main" if @product_photo.main
    fill_in "Product", with: @product_photo.product_id
    click_on "Create Product photo"

    assert_text "Product photo was successfully created"
    click_on "Back"
  end

  test "updating a Product photo" do
    visit product_photos_url
    click_on "Edit", match: :first

    fill_in "Image", with: @product_photo.image
    check "Main" if @product_photo.main
    fill_in "Product", with: @product_photo.product_id
    click_on "Update Product photo"

    assert_text "Product photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Product photo" do
    visit product_photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product photo was successfully destroyed"
  end
end
