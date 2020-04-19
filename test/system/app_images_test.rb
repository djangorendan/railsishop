require "application_system_test_case"

class AppImagesTest < ApplicationSystemTestCase
  setup do
    @app_image = app_images(:one)
  end

  test "visiting the index" do
    visit app_images_url
    assert_selector "h1", text: "App Images"
  end

  test "creating a App image" do
    visit app_images_url
    click_on "New App Image"

    click_on "Create App image"

    assert_text "App image was successfully created"
    click_on "Back"
  end

  test "updating a App image" do
    visit app_images_url
    click_on "Edit", match: :first

    click_on "Update App image"

    assert_text "App image was successfully updated"
    click_on "Back"
  end

  test "destroying a App image" do
    visit app_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App image was successfully destroyed"
  end
end
